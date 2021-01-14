import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["hover", "song", "audio"]

  connect() {
    // this.songs = this.songTargets
    this.songs = this.songTargets.sort(() => 0.5 - Math.random())
  }

  playing(e) {
    this.currentSong?.classList?.remove('current')
    this.currentSong = e.target.closest('tr')
    this.currentSong.classList.add('current')
  }

  prev(e) {
    e.preventDefault()
    this.playSong(this.songs[this.currentSongIndex - 1])
  }

  next(e) {
    e.preventDefault()
    this.playSong(this.songs[this.currentSongIndex + 1])
  }

  togglePause(e) {
    e.preventDefault()
    this.audioTarget.paused ? this.audioTarget.play() : this.audioTarget.pause()
  }

  playSong(song) {
    if(song) {
      song.querySelector('.play a').click()
    }
  }

  get currentSongIndex() {
    return this.songs.indexOf(this.currentSong)
  }
}
