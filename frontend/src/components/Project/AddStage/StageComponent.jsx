import React, { useRef, useCallback } from 'react'
import { RiDeleteBinLine } from 'react-icons/ri'
import { TextField, Autocomplete } from '@mui/material'
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { DatePicker } from '@mui/x-date-pickers/DatePicker'
import dayjs from 'dayjs'
import { useSortable } from '@dnd-kit/sortable'
import { CSS } from '@dnd-kit/utilities'
import { useSelector } from 'react-redux'

const sx = {
  width: '200px',
  borderRadius: '1px solid #7D7D7D',
  MuiOutlinedInputRoot: {
    height: '50px',
  },
  MuiFormLabelRoot: {
    height: '50px',
    lineHeight: '50px',
    top: '-15px',
  },
}

const StageComponent = ({
  stage,
  stages,
  setStages,
  index,
  action,
  isChanged,
  setIsChanged,
  name,
}) => {
  const { stages: stagesList } = useSelector((state) => state.stages)

  const { attributes, listeners, setNodeRef, transform, transition } =
    useSortable({ id: index })

  const style = {
    transition,
    transform: CSS.Transform.toString(transform),
  }

  const handleChange = useCallback(
    (e, field) => {
      const updatedStages = [...stages]
      console.log({ updatedStages: updatedStages })
      if (field === 'startDate' || field === 'endDate') {
        updatedStages[index][field] = e ? dayjs(e).format('YYYY-MM-DD') : ''
      } else {
        const { name, value } = e.target
        updatedStages[index][name] = value
      }

      if (updatedStages[index].endDate < updatedStages[index].startDate) {
        updatedStages[index].endDate = ''
        updatedStages[index].duration = 0
      }

      setStages(updatedStages)
      setIsChanged((prev) => {
        const updated = [...prev]
        updated[index] = true
        return updated
      })
    },
    [index, stages, setStages, setIsChanged]
  )

  const handleDeleteStage = useCallback(() => {
    setStages((prevStages) => prevStages.filter((_, i) => i !== index))
    setIsChanged((prev) => prev.filter((_, i) => i !== index))
  }, [index, setStages, setIsChanged])

  return (
    <div
      className="stageDetails"
      ref={setNodeRef}
      {...attributes}
      {...listeners}
      style={style}
    >
      <p className="serialNo">{index + 1}.</p>
      <div className="stageFields" style={{ margin: '0' }}>
        <Autocomplete
          disablePortal
          freeSolo
          value={stage.stageName || ''}
          onInputChange={(event, newInputValue) => {
            // Only update if the new value is different from the current value
            if (newInputValue !== stage.stageName) {
              handleChange({
                target: { name: 'stageName', value: newInputValue },
              })
            }
          }}
          options={stagesList}
          sx={{
            width: '200px',
          }}
          renderInput={(params) => (
            <TextField
              {...params}
              label={name == 'substage' ? 'Substage Name' : 'Stage Name'}
              name="stageName"
              sx={{
                width: '180px',
                borderRadius: '1px solid #7D7D7D',
                '& .MuiOutlinedInput-root': {
                  height: '50px',
                },
                '& .MuiFormLabel-root': {
                  height: '50px',
                  lineHeight: '50px',
                  top: '-15px',
                },
              }}
              required
            />
          )}
        />

        <TextField
          label="Owner"
          variant="outlined"
          name="owner"
          value={stage.owner}
          onChange={handleChange}
          required
          sx={{
            width: '200px',
            borderRadius: '1px solid #7D7D7D',
            '& .MuiOutlinedInput-root': {
              height: '50px',
            },
            '& .MuiFormLabel-root': {
              height: '50px',
              lineHeight: '50px',
              top: '-15px',
            },
          }}
          InputProps={{ sx: { borderRadius: 2 } }}
        />
        <TextField
          label="Machine"
          variant="outlined"
          name="machine"
          value={stage.machine}
          onChange={handleChange}
          sx={{
            width: '200px',
            borderRadius: '1px solid #7D7D7D',
            '& .MuiOutlinedInput-root': {
              height: '50px',
            },
            '& .MuiFormLabel-root': {
              height: '50px',
              lineHeight: '50px',
              top: '-15px',
            },
          }}
          InputProps={{ sx: { borderRadius: 2 } }}
        />
        <LocalizationProvider dateAdapter={AdapterDayjs}>
          <DatePicker
            label="Start date"
            value={dayjs(stage.startDate)}
            onChange={(date) => handleChange(date, 'startDate')}
            sx={{
              width: '200px',
              borderRadius: '1px solid #7D7D7D',
              '& .MuiOutlinedInput-root': {
                height: '50px',
              },
              '& .MuiFormLabel-root': {
                height: '50px',
                lineHeight: '50px',
                top: '-15px',
              },
            }}
            renderInput={(params) => (
              <TextField
                {...params}
                sx={{
                  width: '200px',
                  borderRadius: '1px solid #7D7D7D',
                  '& .MuiOutlinedInput-root': {
                    height: '50px',
                  },
                  '& .MuiFormLabel-root': {
                    height: '50px',
                    lineHeight: '50px',
                    top: '-15px',
                  },
                }}
                InputProps={{ sx: { borderRadius: 2 } }}
              />
            )}
            required
            InputProps={{ sx: { borderRadius: 2 } }}
          />
        </LocalizationProvider>
        <LocalizationProvider dateAdapter={AdapterDayjs}>
          <DatePicker
            label="End date"
            value={dayjs(stage.endDate)}
            onChange={(date) => handleChange(date, 'endDate')}
            renderInput={(params) => (
              <TextField
                {...params}
                sx={{
                  width: '200px',
                  borderRadius: '1px solid #7D7D7D',
                  '& .MuiOutlinedInput-root': {
                    height: '50px',
                  },
                  '& .MuiFormLabel-root': {
                    height: '50px',
                    lineHeight: '50px',
                    top: '-15px',
                  },
                }}
                InputProps={{ sx: { borderRadius: 2 } }}
              />
            )}
            required
            sx={{
              width: '200px',
              borderRadius: '1px solid #7D7D7D',
              '& .MuiOutlinedInput-root': {
                height: '50px',
              },
              '& .MuiFormLabel-root': {
                height: '50px',
                lineHeight: '50px',
                top: '-15px',
              },
            }}
            InputProps={{ sx: { borderRadius: 2 } }}
          />
        </LocalizationProvider>
        <TextField
          type="number"
          label="Duration(Hrs)"
          variant="outlined"
          name="duration"
          value={stage.duration}
          onChange={(e) => handleChange(e)}
          required
          sx={{
            width: '200px',
            borderRadius: '1px solid #7D7D7D',
            '& .MuiOutlinedInput-root': {
              height: '50px',
            },
            '& .MuiFormLabel-root': {
              height: '50px',
              lineHeight: '50px',
              top: '-15px',
            },
          }}
          InputProps={{ sx: { borderRadius: 2 } }}
        />

        <TextField
          label="Progress(%)"
          variant="outlined"
          type="number"
          sx={{
            width: '130px',
            borderRadius: '1px solid #7D7D7D',
            '& .MuiOutlinedInput-root': {
              height: '50px',
            },
            '& .MuiFormLabel-root': {
              height: '50px',
              lineHeight: '50px',
              top: '-15px',
            },
          }}
          InputProps={{ sx: { borderRadius: 2 } }}
          name="progress"
          value={
            stage.progress < 0 ? 0 : stage.progress > 100 ? 100 : stage.progress
          }
          onChange={handleChange}
          required
        />
        {action === 'update' && isChanged[index] && (
          <TextField
            label="Reason"
            variant="outlined"
            name="updateReason"
            value={stage.updateReason}
            onChange={(e) => handleChange(e)}
            required
            sx={{
              width: '200px',
              borderRadius: '1px solid #7D7D7D',
              '& .MuiOutlinedInput-root': {
                height: '50px',
              },
              '& .MuiFormLabel-root': {
                height: '50px',
                lineHeight: '50px',
                top: '-15px',
              },
            }}
          />
        )}
      </div>
      <div className="option-icons">
        <button className="option" onClick={handleDeleteStage}>
          <RiDeleteBinLine />
        </button>
      </div>
    </div>
  )
}

export default StageComponent
