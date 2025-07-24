<script setup>
// 小說網首頁組件
import { ref, onMounted } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

// 註冊GSAP插件
gsap.registerPlugin(ScrollTrigger)

const showNotification = ref(true)

const dismissNotification = () => {
  showNotification.value = false
}

// 輪播圖相關
const currentSlide = ref(0)
const slides = ref([
  { id: 1, title: '圖片 1' },
  { id: 2, title: '圖片 2' },
  { id: 3, title: '圖片 3' },
])

const goToSlide = (index) => {
  // 添加輪播圖切換動畫
  gsap.to('.carousel-wrapper', {
    x: `-${index * 100}%`,
    duration: 0.8,
    ease: 'power2.inOut',
  })
  currentSlide.value = index
}

// 動畫初始化
onMounted(() => {
  // Hero區域動畫
  gsap
    .timeline()
    .fromTo(
      '.title-read',
      { x: -200, opacity: 0 },
      { x: 0, opacity: 1, duration: 1.2, ease: 'power3.out' },
    )
    .fromTo(
      '.title-anywhere',
      { x: 200, opacity: 0 },
      { x: 0, opacity: 1, duration: 1.2, ease: 'power3.out' },
      '-=0.8',
    )
    .fromTo(
      '.hero-subtitle',
      { y: 50, opacity: 0 },
      { y: 0, opacity: 1, duration: 1, ease: 'power2.out' },
      '-=0.5',
    )
    .fromTo(
      '.cta-button',
      { scale: 0, opacity: 0 },
      { scale: 1, opacity: 1, duration: 0.8, ease: 'back.out(1.7)' },
      '-=0.3',
    )

  // 書籍卡片動畫
  gsap.fromTo(
    '.book-card',
    { y: 80, opacity: 0, scale: 0.8 },
    {
      y: 0,
      opacity: 1,
      scale: 1,
      duration: 0.8,
      ease: 'power2.out',
      stagger: 0.1,
      scrollTrigger: {
        trigger: '.books-grid',
        start: 'top 80%',
        end: 'bottom 20%',
        toggleActions: 'play none none reverse',
      },
    },
  )

  // 作家卡片動畫
  gsap.fromTo(
    '.author-card',
    { y: 60, opacity: 0, rotationY: 45 },
    {
      y: 0,
      opacity: 1,
      rotationY: 0,
      duration: 1,
      ease: 'power3.out',
      stagger: 0.2,
      scrollTrigger: {
        trigger: '.authors-grid',
        start: 'top 80%',
        toggleActions: 'play none none reverse',
      },
    },
  )

  // 輪播圖動畫
  gsap.fromTo(
    '.carousel-container',
    { scale: 0.8, opacity: 0 },
    {
      scale: 1,
      opacity: 1,
      duration: 1.2,
      ease: 'power2.out',
      scrollTrigger: {
        trigger: '.carousel-section',
        start: 'top 70%',
        toggleActions: 'play none none reverse',
      },
    },
  )

  // 最近更新列表動畫
  gsap.fromTo(
    '.update-item',
    { x: -100, opacity: 0 },
    {
      x: 0,
      opacity: 1,
      duration: 0.8,
      ease: 'power2.out',
      stagger: 0.1,
      scrollTrigger: {
        trigger: '.updates-list',
        start: 'top 80%',
        toggleActions: 'play none none reverse',
      },
    },
  )

  // 區塊標題動畫
  gsap.fromTo(
    '.section-title',
    { y: 30, opacity: 0 },
    {
      y: 0,
      opacity: 1,
      duration: 0.8,
      ease: 'power2.out',
      stagger: 0.2,
      scrollTrigger: {
        trigger: '.section-title',
        start: 'top 85%',
        toggleActions: 'play none none reverse',
      },
    },
  )
})
</script>

<template>
  <div class="home">
    <!-- 導航欄 -->
    <nav class="navbar">
      <div class="nav-container">
        <div class="nav-left">
          <div class="nav-logo">
            <h2>小說網</h2>
          </div>
          <div class="nav-menu">
            <a href="/" class="nav-link active">首頁</a>
            <a href="/library" class="nav-link">書庫</a>
            <a href="/authors" class="nav-link">作家專區</a>
          </div>
        </div>

        <div class="nav-right">
          <div class="nav-search">
            <div class="search-container">
              <input type="text" placeholder="請輸入書名或作者" class="search-input" />
              <button class="search-btn">
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                  <path
                    d="M7.5 13.5C10.8137 13.5 13.5 10.8137 13.5 7.5C13.5 4.18629 10.8137 1.5 7.5 1.5C4.18629 1.5 1.5 4.18629 1.5 7.5C1.5 10.8137 4.18629 13.5 7.5 13.5Z"
                    stroke="currentColor"
                    stroke-width="1.5"
                  />
                  <path
                    d="M12.5 12.5L14.5 14.5"
                    stroke="currentColor"
                    stroke-width="1.5"
                    stroke-linecap="round"
                  />
                </svg>
              </button>
            </div>
          </div>
          <div class="nav-user">
            <div class="user-avatar">
              <!-- 如果有圖片就顯示圖片，否則顯示佔位符 -->
              <!-- <img src="/path/to/user-image.jpg" alt="用戶頭像" class="avatar-image" /> -->
              <svg
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12Z"
                  fill="#999999"
                />
                <path
                  d="M12 14C7.58172 14 4 17.5817 4 22H20C20 17.5817 16.4183 14 12 14Z"
                  fill="#999999"
                />
              </svg>
            </div>
            <a href="/login" class="login-btn">登入</a>
          </div>
        </div>
        <div class="nav-toggle">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </nav>

    <!-- 英雄區域 -->
    <section class="hero">
      <div class="hero-container">
        <div class="hero-content">
          <div class="hero-main">
            <div class="hero-title-container">
              <div class="title-line title-read">Read</div>
              <div class="title-line title-anywhere">Anywhere</div>
            </div>
            <div class="hero-content-bottom">
              <p class="hero-subtitle">
                在哪都能夠隨心所欲的閱讀，<br />
                享受閱讀帶給你的快樂
              </p>
              <button class="cta-button">馬上閱讀 →</button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 推薦榜單區域 -->
    <section id="library" class="recommended">
      <div class="container">
        <div class="section-header">
          <h2 class="section-title">推薦榜單</h2>
          <p class="section-subtitle">依作品好評、人氣、互動等綜合得分排行</p>
        </div>
        <div class="books-grid">
          <div class="book-card" v-for="i in 10" :key="i">
            <div class="book-cover">
              <div class="cover-placeholder"></div>
            </div>
            <div class="book-info">
              <h3 class="book-title">書名</h3>
              <p class="book-category">種類</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 金榜作家區域 -->
    <section class="featured-authors">
      <div class="container">
        <div class="section-header">
          <h2 class="section-title">金榜作家</h2>
        </div>
        <div class="authors-grid">
          <div class="author-card" v-for="i in 4" :key="i">
            <div class="author-avatar">
              <div class="avatar-placeholder"></div>
            </div>
            <div class="author-info">
              <h3 class="author-name">作家</h3>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 輪播圖區域 -->
    <section class="carousel-section">
      <div class="container">
        <div class="section-header">
          <h2 class="section-title">輪播圖</h2>
        </div>
        <div class="carousel-container">
          <div
            class="carousel-wrapper"
            :style="{ transform: `translateX(-${currentSlide * 100}%)` }"
          >
            <div class="carousel-slide" v-for="(slide, index) in slides" :key="index">
              <div class="slide-image">
                <div class="image-placeholder">圖片 {{ index + 1 }}</div>
              </div>
            </div>
          </div>
          <div class="carousel-indicators">
            <button
              v-for="(slide, index) in slides"
              :key="index"
              class="indicator"
              :class="{ active: currentSlide === index }"
              @click="goToSlide(index)"
            ></button>
          </div>
        </div>
      </div>
    </section>

    <!-- 最近更新區域 -->
    <section class="recent-updates">
      <div class="container">
        <div class="section-header">
          <h2 class="section-title">最近更新</h2>
        </div>
        <div class="updates-list">
          <div class="update-item" v-for="i in 5" :key="i">
            <span class="update-type">類型</span>
            <span class="update-title">書名</span>
            <span class="update-author">作者</span>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
      <div class="container">
        <div class="footer-content">
          <div class="footer-section">
            <h3 class="footer-title">小說網</h3>
            <p class="footer-desc">提供優質的線上小說閱讀體驗</p>
            <div class="social-links">
              <a href="#" class="social-link">Facebook</a>
              <a href="#" class="social-link">Twitter</a>
              <a href="#" class="social-link">Instagram</a>
            </div>
          </div>

          <div class="footer-section">
            <h4 class="footer-subtitle">閱讀服務</h4>
            <ul class="footer-links">
              <li><a href="#">線上閱讀</a></li>
              <li><a href="#">書庫管理</a></li>
              <li><a href="#">個人書架</a></li>
              <li><a href="#">閱讀記錄</a></li>
            </ul>
          </div>

          <div class="footer-section">
            <h4 class="footer-subtitle">作家專區</h4>
            <ul class="footer-links">
              <li><a href="#">創作投稿</a></li>
              <li><a href="#">作品管理</a></li>
              <li><a href="#">收益查看</a></li>
              <li><a href="#">創作指南</a></li>
            </ul>
          </div>

          <div class="footer-section">
            <h4 class="footer-subtitle">幫助中心</h4>
            <ul class="footer-links">
              <li><a href="#">使用說明</a></li>
              <li><a href="#">常見問題</a></li>
              <li><a href="#">聯絡客服</a></li>
              <li><a href="#">意見反饋</a></li>
            </ul>
          </div>

          <div class="footer-section">
            <h4 class="footer-subtitle">關於我們</h4>
            <ul class="footer-links">
              <li><a href="#">公司介紹</a></li>
              <li><a href="#">服務條款</a></li>
              <li><a href="#">隱私政策</a></li>
              <li><a href="#">版權聲明</a></li>
            </ul>
          </div>
        </div>

        <div class="footer-bottom">
          <div class="footer-copyright">
            <p>&copy; 2024 小說網. 版權所有.</p>
          </div>
          <div class="footer-legal">
            <a href="#">服務條款</a>
            <a href="#">隱私政策</a>
            <a href="#">Cookie政策</a>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<style scoped>
/* 全局樣式 */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.home {
  font-family:
    'Inter',
    -apple-system,
    BlinkMacSystemFont,
    'Segoe UI',
    Roboto,
    sans-serif;
  line-height: 1.6;
  color: #333333;
  background-color: #ffffff;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

/* 導航欄 - 完全按照圖片設計 */
.navbar {
  background: #ffffff;
  padding: 16px 0;
  border-bottom: 1px solid #f0f0f0;
}

.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav-logo h2 {
  color: #333333;
  font-weight: 600;
  font-size: 1.5rem;
  margin: 0;
}

.nav-left {
  display: flex;
  align-items: center;
  gap: 2rem;
}

.nav-menu {
  display: flex;
  gap: 32px;
}

.nav-link {
  text-decoration: none;
  color: #666666;
  font-weight: 400;
  font-size: 14px;
  transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
  padding: 8px 0;
  position: relative;
  overflow: hidden;
}

.nav-link:hover,
.nav-link.active {
  color: #333333;
}

.nav-search {
  width: 280px;
}

.search-container {
  position: relative;
  display: flex;
  align-items: center;
}

.search-input {
  width: 100%;
  padding: 8px 36px 8px 12px;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
  font-size: 14px;
  outline: none;
  transition: border-color 0.2s ease;
  background: #fafafa;
}

.search-input:focus {
  border-color: #27f9cd;
  background: white;
}

.search-input::placeholder {
  color: #999999;
}

.search-btn {
  position: absolute;
  right: 10px;
  background: none;
  border: none;
  color: #999999;
  cursor: pointer;
  padding: 4px;
  border-radius: 3px;
  transition: color 0.2s ease;
}

.search-btn:hover {
  color: #27f9cd;
}

.nav-right {
  display: flex;
  align-items: center;
  gap: 2rem;
}

.nav-user {
  display: flex;
  align-items: center;
  gap: 20px;
}

.user-avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: #e5e5e5;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  cursor: pointer;
  transition: all 0.2s ease;
  border: 2px solid transparent;
}

.user-avatar:hover {
  border-color: #27f9cd;
  box-shadow: 0 2px 8px rgba(39, 249, 205, 0.2);
}

.avatar-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 50%;
}

.login-btn {
  padding: 8px 20px;
  background: #27f9cd;
  color: white;
  text-decoration: none;
  border-radius: 3px;
  font-weight: 500;
  font-size: 14px;
  transition: all 0.2s ease;
}

.login-btn:hover {
  background: #27ba9b;
  transform: translateY(-1px);
}

.nav-toggle {
  display: none;
  flex-direction: column;
  cursor: pointer;
}

.nav-toggle span {
  width: 25px;
  height: 3px;
  background: #333;
  margin: 3px 0;
  transition: 0.3s;
}

/* 英雄區域 - 完全按照圖片設計 */
.hero {
  background: linear-gradient(135deg, #93ddcd 0%, #93fbe5 100%);
  color: white;
  min-height: 500px;
  display: flex;
  align-items: center;
  position: relative;
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
  width: 100%;
}

.hero-content {
  display: flex;
  justify-content: center;
  align-items: center;
  max-width: 1200px;
  width: 100%;
}

.hero-main {
  text-align: center;
  width: 100%;
}

.hero-title-container {
  margin-bottom: 40px;
}

.title-line {
  font-size: 210px;
  font-weight: 300;
  line-height: 0.9;
  color: white;
  letter-spacing: -3px;
  margin-bottom: 20px;
  position: relative;
}

.title-read {
  text-align: left;
  margin-left: 0;
}

.title-anywhere {
  text-align: right;
  margin-right: 0;
  position: relative;
}

.hero-content-bottom {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  margin-top: 2rem;
  gap: 2rem;
}

.hero-content-bottom .cta-button {
  flex-shrink: 0;
  margin-top: -4px;
}

.hero-subtitle {
  font-size: 16px;
  color: white;
  line-height: 1.6;
  margin-bottom: 40px;
  opacity: 0.9;
  text-align: left;
  margin-left: 0;
}

.cta-button {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: transparent;
  color: #333333;
  border: 1px solid white;
  border-radius: 3px;
  font-weight: 600;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transform-origin: center;
}

.cta-button:hover {
  background: rgba(51, 51, 51, 0.1);
  border-color: #333333;
  transform: scale(1.05);
}

/* 推薦榜單區域 */
.recommended {
  padding: 80px 0;
  background: white;
}

.section-header {
  margin-bottom: 3rem;
}

.section-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #333333;
  margin-bottom: 0.5rem;
}

.section-subtitle {
  color: #666;
  font-size: 1rem;
}

.books-grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 1.5rem;
}

.book-card {
  background: white;
  border-radius: 3px;
  overflow: hidden;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.4s ease;
  transform-origin: center;
}

.book-card:hover {
  transform: translateY(-10px) scale(1.02);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.book-cover {
  height: 120px;
  background: #f1f5f9;
  display: flex;
  align-items: center;
  justify-content: center;
}

.cover-placeholder {
  width: 80px;
  height: 80px;
  background: #e2e8f0;
  border-radius: 3px;
}

.book-info {
  padding: 1rem;
  text-align: center;
}

.book-title {
  font-size: 1rem;
  font-weight: 600;
  color: #333333;
  margin-bottom: 0.5rem;
}

.book-category {
  font-size: 0.9rem;
  color: #666;
}

/* 金榜作家區域 */
.featured-authors {
  padding: 4rem 0;
  background: #fafafa;
}

.authors-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 2rem;
}

.author-card {
  background: white;
  border-radius: 3px;
  padding: 2rem 1rem;
  text-align: center;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.4s ease;
  transform-origin: center;
}

.author-card:hover {
  transform: translateY(-8px) scale(1.03);
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}

.author-avatar {
  width: 80px;
  height: 80px;
  margin: 0 auto 1rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

.avatar-placeholder {
  width: 80px;
  height: 80px;
  background: #e2e8f0;
  border-radius: 50%;
}

.author-name {
  font-size: 1.1rem;
  font-weight: 600;
  color: #333333;
}

/* 輪播圖區域 */
.carousel-section {
  padding: 2rem 0;
  background: white;
}

.carousel-container {
  position: relative;
  width: 100%;
  margin: 0;
  overflow: hidden;
}

.carousel-wrapper {
  display: flex;
  transition: transform 0.5s ease-in-out;
}

.carousel-slide {
  min-width: 100%;
  height: 400px;
}

.slide-image {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #93ddcd 0%, #93fbe5 100%);
}

.image-placeholder {
  font-size: 2rem;
  font-weight: 600;
  color: #333333;
  text-align: center;
}

.carousel-indicators {
  position: absolute;
  bottom: 1rem;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 0.5rem;
}

.indicator {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  border: none;
  background: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  transition: all 0.3s ease;
}

.indicator.active {
  background: white;
  transform: scale(1.2);
}

.indicator:hover {
  background: rgba(255, 255, 255, 0.8);
}

/* 最近更新區域 */
.recent-updates {
  padding: 4rem 0;
  background: white;
}

.recent-updates .section-header {
  text-align: center;
}

.updates-list {
  max-width: 800px;
  margin: 0 auto;
}

.update-item {
  display: flex;
  align-items: center;
  padding: 1rem 2rem;
  border-bottom: 1px solid #f0f0f0;
  transition: background-color 0.2s ease;
}

.update-item:last-child {
  border-bottom: none;
}

.update-item:hover {
  background-color: #f8f9fa;
}

.update-type {
  min-width: 80px;
  font-size: 0.9rem;
  color: #666;
  margin-right: 2rem;
}

.update-title {
  flex: 1;
  font-weight: 500;
  color: #333;
  text-align: center;
}

.update-author {
  min-width: 80px;
  font-size: 0.9rem;
  color: #666;
  text-align: right;
}

/* Footer區域 */
.footer {
  background: #c0c0c0;
  color: #333;
  padding: 3rem 0 1rem;
}

.footer-content {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1fr 1fr;
  gap: 2rem;
  margin-bottom: 2rem;
}

.footer-section h3.footer-title {
  font-size: 1.5rem;
  font-weight: 700;
  margin-bottom: 1rem;
  color: #000;
}

.footer-section h4.footer-subtitle {
  font-size: 1.1rem;
  font-weight: 600;
  margin-bottom: 1rem;
  color: #000;
}

.footer-desc {
  margin-bottom: 1.5rem;
  line-height: 1.6;
  color: #333;
}

.social-links {
  display: flex;
  gap: 1rem;
}

.social-link {
  color: #333;
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.2s ease;
}

.social-link:hover {
  color: #000;
}

.footer-links {
  list-style: none;
  padding: 0;
}

.footer-links li {
  margin-bottom: 0.5rem;
}

.footer-links a {
  color: #333;
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.2s ease;
}

.footer-links a:hover {
  color: #000;
}

.footer-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 2rem;
  border-top: 1px solid #aaa;
  font-size: 0.9rem;
}

.footer-legal {
  display: flex;
  gap: 1.5rem;
}

.footer-legal a {
  color: #333;
  text-decoration: none;
  transition: color 0.2s ease;
}

.footer-legal a:hover {
  color: #000;
}

/* 響應式設計 */
@media (max-width: 768px) {
  .nav-center,
  .nav-user {
    display: none;
  }

  .nav-toggle {
    display: flex;
  }

  .nav-container {
    padding: 0 20px;
  }

  .title-line {
    font-size: 72px;
  }

  .title-read,
  .title-anywhere {
    text-align: center;
  }

  .hero-content-bottom {
    flex-direction: column;
    align-items: center;
    gap: 1.5rem;
  }

  .books-grid {
    grid-template-columns: repeat(2, 1fr);
  }

  .authors-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
  }
}

@media (max-width: 480px) {
  .title-line {
    font-size: 48px;
  }

  .hero-subtitle {
    font-size: 14px;
    text-align: center;
  }

  .books-grid {
    grid-template-columns: 1fr;
  }

  .authors-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
  }

  .author-card {
    padding: 1.5rem 1rem;
  }

  .avatar-placeholder {
    width: 60px;
    height: 60px;
  }

  .author-avatar {
    width: 60px;
    height: 60px;
  }

  .carousel-slide {
    height: 250px;
  }

  .image-placeholder {
    font-size: 1.5rem;
  }

  .footer-content {
    grid-template-columns: 1fr;
    gap: 2rem;
  }

  .footer-bottom {
    flex-direction: column;
    gap: 1rem;
    text-align: center;
  }

  .footer-legal {
    justify-content: center;
  }

  .update-item {
    padding: 1rem;
    flex-direction: column;
    text-align: center;
    gap: 0.5rem;
  }

  .update-type,
  .update-author {
    min-width: auto;
    margin-right: 0;
  }
}
</style>
