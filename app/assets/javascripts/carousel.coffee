class window.Carousel
  'use strict'

  constructor: (carousel, seats, @lastSeat, trigger) ->
    @carousel = $(carousel)
    @seats    = $(seats)
    @trigger  = $(trigger)

  ride: (elLast)->
    @trigger.on 'click', (e) =>
      el = $(elLast).removeClass @lastSeat

      if $(e.currentTarget).data('toggle') is 'next'
        new_seat = @next el
        @carousel.removeClass 'is-reversing'
      else
        new_seat = @prev el
        @carousel.addClass 'is-reversing'

      new_seat.addClass(@lastSeat).css 'order', 1
      new_seat = @next(new_seat).css('order', i) for i in [2..@seats.length]

      @carousel.removeClass 'is-set'

  prev: (el) -> if el.prev().length > 0 then el.prev() else @seats.last()

  next: (el) -> if el.next().length > 0 then el.next() else @seats.first()

$ ->
  editors = new Carousel '#current-editors', '.editor-seat', 'last-editor', '.toggle-editors'
  editors.ride('.last-editor')

  cases = new Carousel '#case-examples', '.case-seat', 'last-case', '.toggle-cases'
  cases.ride('.last-case')
