# a gallery

基于 node.js 的 web 画廊

## Installation

0. 上传图片至 `resources/photos`
1. 安装依赖

```
# Ubuntu 16.04
sudo apt-get install gcc-multilib
npm install

# CentOS 7
sudo yum install glibc.i686
npm install
```

2. 启动 `npm run start`

## 配置

`config.js`

```
module.exports = {
    title: 'A Gallery',                    // 相册名
    wording: {
        noAccess: '私密相册，拒绝查看'        // 提示信息
    },
    albums: {                                // 相册信息
        "xxx1": {                            // 相册 xxx1
            thumbnail : "xxx1.JPG",          // 封面
            sort: 1
        }, 
        "xxx2": {
            description : "介绍一下",         //相册简介
            thumbnail : "xxx2.jpg",
            name: "相册名称"                  // 相册名称
        },
        "xxx3": {
            description : "私密相册",
            name: "私密相册",
            password: "123456",               // 私密相册密码
            passwordTips: "123"               // 私密相册密码提示
        }
    }
}
```

## Develop

编译运行：

```
npm run dev 或 npm run dist
```
