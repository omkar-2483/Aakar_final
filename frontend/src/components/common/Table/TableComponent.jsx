import React, { useState, useMemo, useCallback } from 'react'
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Collapse,
  Typography,
  Box,
  TablePagination,
  TableSortLabel,
  IconButton,
} from '@mui/material'
import { Link, useNavigate } from 'react-router-dom'
import { useDispatch, useSelector } from 'react-redux'
import { FiEdit2 } from 'react-icons/fi'
import { FaRegClock } from 'react-icons/fa'
import { RiDeleteBinLine } from 'react-icons/ri'
import {
  deleteProject,
  fetchHistoryProjects,
} from '../../../features/projectSlice'
import {
  fetchHistoryStagesByStageId,
  fetchActiveStagesByProjectNumber,
  deleteStage,
} from '../../../features/stageSlice'
import { formatDate, formatTimeDate } from '../../common/functions/formatDate'
import LinearProgress from '@mui/material/LinearProgress'
import './TableComponent.css'
import {
  deleteSubStage,
  getHistorySubStagesBySubStageId,
} from '../../../features/subStageSlice'

const TableComponent = ({
  whose,
  rows,
  columns,
  linkBasePath,
  optionLinkBasePath,
}) => {
  const access = [
    1 /*add project*/, 1 /*edit project*/, 1 /*delete project*/,
    1 /*view history project*/, 1 /*add stage*/, 1 /*edit stage*/,
    1 /*delete stage*/, 1 /*view stage history*/, 1 /*view substage history*/,
    1 /*add project*/, 1 /*add project*/, 1 /*add project*/,
  ]
  const dispatch = useDispatch()
  const navigate = useNavigate()
  const [page, setPage] = useState(0)
  const [rowsPerPage, setRowsPerPage] = useState(10)
  const [order, setOrder] = useState('asc')
  const [orderBy, setOrderBy] = useState('')
  const [openIndex, setOpenIndex] = useState(null)

  const historyData1 = useSelector((state) => {
    switch (whose) {
      case 'project':
        return state.projects.historyProjects
      case 'stage':
        return state.stages.historyStages
      case 'substage':
        return state.substages.historySubStages
      default:
        return []
    }
  })

  const historyDataLoading = useSelector((state) => {
    switch (whose) {
      case 'project':
        return state.projects.loading
      case 'stage':
        return state.stages.loading
      case 'substage':
        return state.substages.loading
      default:
        return []
    }
  })

  const historyData = useMemo(
    () =>
      historyData1.map((row) => ({
        ...row,
        startDate: formatDate(row.startDate),
        endDate: formatDate(row.endDate),
      })),
    [historyData1]
  )

  const formattedRows = useMemo(
    () =>
      rows.map((row) => ({
        ...row,
        startDate: formatDate(row.startDate),
        endDate: formatDate(row.endDate),
      })),
    [rows]
  )

  const handleChangePage = useCallback((event, newPage) => {
    setPage(newPage)
  }, [])

  const handleChangeRowsPerPage = useCallback((event) => {
    setRowsPerPage(+event.target.value)
    setPage(0)
  }, [])

  const handleRequestSort = useCallback(
    (property) => {
      const isAsc = orderBy === property && order === 'asc'
      setOrder(isAsc ? 'desc' : 'asc')
      setOrderBy(property)
    },
    [order, orderBy]
  )

  const getComparator = useCallback((order, orderBy) => {
    return order === 'desc'
      ? (a, b) => descendingComparator(a, b, orderBy)
      : (a, b) => -descendingComparator(a, b, orderBy)
  }, [])

  const descendingComparator = useCallback((a, b, orderBy) => {
    if (b[orderBy] < a[orderBy]) return -1
    if (b[orderBy] > a[orderBy]) return 1
    return 0
  }, [])

  const stableSort = useCallback((array, comparator) => {
    const stabilizedArray = array.map((el, index) => [el, index])
    stabilizedArray.sort((a, b) => {
      const order = comparator(a[0], b[0])
      if (order !== 0) return order
      return a[1] - b[1]
    })
    return stabilizedArray.map((el) => el[0])
  }, [])

  const handleRowClick = useCallback(
    (clickIndex, row) => {
      if (whose === 'project') {
        dispatch(fetchHistoryProjects(row.projectNumber))
      } else if (whose === 'stage') {
        dispatch(fetchHistoryStagesByStageId(row.stageId))
      } else if (whose === 'substage') {
        dispatch(getHistorySubStagesBySubStageId(row.substageId))
      }

      setOpenIndex((prevIndex) =>
        prevIndex === clickIndex ? null : clickIndex
      )
    },
    [dispatch, whose]
  )

  const handleDelete = useCallback(
    (row) => {
      const id =
        whose === 'project'
          ? row.projectNumber
          : whose === 'stage'
          ? row.stageId
          : whose === 'substage'
          ? row.substageId
          : ''
      const confirmMessage =
        whose === 'project'
          ? `Are you sure you want to delete project "${row.projectNumber}"?`
          : whose === 'stage'
          ? `Are you sure you want to delete stage "${row.stageName}"?`
          : whose === 'substage'
          ? `Are you sure you want to delete substage "${row.stageName}"?`
          : ''
      if (window.confirm(confirmMessage)) {
        whose === 'project'
          ? dispatch(deleteProject(id))
          : whose == 'stage'
          ? dispatch(deleteStage(id))
          : whose === 'substage'
          ? dispatch(deleteSubStage(id))
          : ''
      }
    },
    [dispatch]
  )

  const sortedRows = useMemo(() => {
    return stableSort(formattedRows, getComparator(order, orderBy))
  }, [formattedRows, stableSort, getComparator, order, orderBy])

  const paginatedRows = useMemo(() => {
    return sortedRows.slice(
      page * rowsPerPage,
      page * rowsPerPage + rowsPerPage
    )
  }, [sortedRows, page, rowsPerPage])

  return (
    <Paper className="table-container">
      <TableContainer
        className={`custom-scrollbar ${whose == 'project' ? 'project' : ''}`}
      >
        <Table aria-label="data table">
          <TableHead>
            <TableRow>
              <TableCell
                align="left"
                sx={{
                  fontWeight: 'bold',
                  backgroundColor: '#FFFFFF',
                  color: '#002773',
                  fontSize: '16px',
                  textAlign: 'left',
                  fontFamily: 'Inter, sans-serif',
                  position: 'sticky',
                  top: 0,
                  zIndex: 1,
                }}
              >
                Sr. No.
              </TableCell>
              {columns.map((column) => (
                <TableCell
                  key={column.id}
                  align={column.align}
                  sx={{
                    fontWeight: 'bold',
                    backgroundColor: '#FFFFFF',
                    color: '#002773',
                    fontSize: '16px',
                    textAlign: 'left',
                    fontFamily: 'Inter, sans-serif',
                    position: 'sticky',
                    top: 0,
                    zIndex: 1,
                  }}
                  sortDirection={orderBy === column.id ? order : false}
                >
                  <TableSortLabel
                    active={orderBy === column.id}
                    direction={orderBy === column.id ? order : 'asc'}
                    onClick={() => handleRequestSort(column.id)}
                  >
                    {column.label}
                  </TableSortLabel>
                </TableCell>
              ))}
              <TableCell
                align="center"
                sx={{
                  fontWeight: 'bold',
                  backgroundColor: '#FFFFFF',
                  color: '#002773',
                  fontSize: '16px',
                  fontFamily: 'Inter, sans-serif',
                  position: 'sticky',
                  top: 0,
                  zIndex: 1,
                }}
              />
            </TableRow>
          </TableHead>
          <TableBody>
            {paginatedRows.map((row, index) => {
              const rowIndex = page * rowsPerPage + index
              return (
                <React.Fragment key={row.id || rowIndex}>
                  <TableRow
                    sx={{
                      cursor: linkBasePath ? 'pointer' : 'default',
                      textDecoration: 'none',
                    }}
                    className="table-row"
                  >
                    <TableCell
                      component={linkBasePath ? Link : 'td'}
                      to={
                        linkBasePath
                          ? `${linkBasePath}/${
                              row.empId || row.deptId || row.projectNumber
                            }
                            }`
                          : undefined
                      }
                      align="center"
                    >
                      {rowIndex + 1}
                    </TableCell>
                    {columns.map((column) => (
                      <TableCell
                        key={column.id}
                        component={linkBasePath ? Link : 'td'}
                        to={
                          linkBasePath
                            ? `${linkBasePath}/${
                                row.stageId || row.projectNumber
                              }`
                            : undefined
                        }
                        align={column.align}
                      >
                        <p
                          className={
                            row[column.id] === 'Completed'
                              ? 'completed'
                              : row[column.id] === 'Overdue'
                              ? 'overdue'
                              : row[column.id] === 'Pending'
                              ? 'pending'
                              : ''
                          }
                        >
                          {row[column.id]}
                        </p>
                      </TableCell>
                    ))}
                    <TableCell
                      sx={{
                        fontFamily: 'Inter, sans-serif',
                        cursor: 'pointer',
                        paddingLeft: '0',
                        paddingRight: '0',
                      }}
                    >
                      {(access[1] && whose == 'project') ||
                      (access[5] && whose == 'stage')
                        ? whose !== 'substage' && (
                            <IconButton
                              onClick={(e) => {
                                e.stopPropagation()
                                navigate(
                                  optionLinkBasePath
                                    ? `${optionLinkBasePath}/${
                                        row.stageId || row.projectNumber
                                      }`
                                    : undefined
                                )
                              }}
                            >
                              <FiEdit2 className="option-icon" />
                            </IconButton>
                          )
                        : ''}
                      {(access[3] && whose == 'project') ||
                      (access[7] && whose == 'stage') ||
                      (access[9] && whose == 'substage') ? (
                        <IconButton
                          onClick={(e) => {
                            e.stopPropagation()
                            handleRowClick(rowIndex, row)
                          }}
                        >
                          <FaRegClock className="option-icon" />
                        </IconButton>
                      ) : (
                        ''
                      )}
                      {(access[2] && whose == 'project') ||
                      (access[6] && whose == 'stage') ||
                      (access[8] && whose == 'substage') ? (
                        <IconButton
                          onClick={(e) => {
                            e.stopPropagation()
                            handleDelete(row)
                          }}
                        >
                          <RiDeleteBinLine className="option-icon" />
                        </IconButton>
                      ) : (
                        ''
                      )}
                    </TableCell>
                  </TableRow>
                  <TableRow className="historyOfStages">
                    <TableCell
                      style={{ paddingBottom: 0, paddingTop: 0 }}
                      colSpan={columns.length + 2}
                    >
                      <Collapse
                        in={openIndex === rowIndex} // Use the single openIndex
                        timeout="auto"
                        unmountOnExit
                      >
                        <Box margin={1}>
                          <Typography variant="h6" gutterBottom>
                            {whose === 'substage'
                              ? 'Substage '
                              : whose === 'stage'
                              ? 'Stage '
                              : whose === 'project'
                              ? 'Project '
                              : ''}{' '}
                            History
                          </Typography>
                          {historyData &&
                          historyData.filter((data) =>
                            whose == 'project'
                              ? data.historyOf == row.projectNumber
                              : whose == 'stage'
                              ? data.historyOf == row.stageId
                              : whose == 'substage'
                              ? data.historyOf == row.substageId
                              : ''
                          ).length > 0 ? (
                            <table className="history-table">
                              <thead>
                                <tr>
                                  {columns
                                    .filter(
                                      (column) => column.id !== 'projectNumber'
                                    )
                                    .map((column) => (
                                      <td key={column.id} align={column.align}>
                                        {column.label}
                                      </td>
                                    ))}
                                  <td>Update Reason</td>
                                  <td>Updated At</td>
                                </tr>
                              </thead>
                              <tbody>
                                {historyData
                                  .filter((data) =>
                                    whose == 'project'
                                      ? data.historyOf == row.projectNumber
                                      : whose == 'stage'
                                      ? data.historyOf == row.stageId
                                      : whose == 'substage'
                                      ? data.historyOf == row.substageId
                                      : ''
                                  )
                                  .map((historyRow, historyIndex) => (
                                    <tr key={historyRow.id || historyIndex}>
                                      {columns
                                        .filter(
                                          (column) =>
                                            column.id !== 'projectNumber'
                                        )
                                        .map((column) => (
                                          <td
                                            key={column.id}
                                            align={column.align}
                                          >
                                            {historyRow[column.id]}
                                          </td>
                                        ))}
                                      <td>{historyRow.updateReason}</td>
                                      <td>
                                        {formatDate(historyRow.timestamp)},{' '}
                                        {formatTimeDate(historyRow.timestamp)}
                                      </td>
                                    </tr>
                                  ))}
                              </tbody>
                            </table>
                          ) : (
                            <Typography>No history found.</Typography>
                          )}
                        </Box>
                      </Collapse>
                    </TableCell>
                  </TableRow>
                </React.Fragment>
              )
            })}
          </TableBody>
        </Table>
      </TableContainer>
      <TablePagination
        rowsPerPageOptions={[10, 25, 100]}
        component="div"
        count={formattedRows.length}
        rowsPerPage={rowsPerPage}
        page={page}
        onPageChange={handleChangePage}
        onRowsPerPageChange={handleChangeRowsPerPage}
      />
    </Paper>
  )
}

export default TableComponent
