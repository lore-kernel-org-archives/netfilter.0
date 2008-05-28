From: "jiuwei li" <lijiuwei0902@gmail.com>
Subject: using kernel_sendmsg function to send tcp package would return broken pipe error
Date: Wed, 28 May 2008 11:10:03 +0800
Message-ID: <122ccabe0805272010x77828bf4ie82263a2de320a87@mail.gmail.com>
References: <122ccabe0805270019o22e5b93cw921d4137466ce64d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=FlIJCQB+28A2RCEuo9n8k5IUx8ubeOGejvY1M6JwjmY=;
        b=iGPr/wv16IzTtY6D7qmuC3X0gEyAmwvjBfaZ0WmMYCG61vCD8iYZipYINx/YMp77kcZ+Qzqx2wmBRSwTc5kulmvIeK4EIDmJtEQk2qLJPfIOUhF20x9KnkaHJKL5pBceMf/3ibkAin5bHYqfveZfIA6FS46LUONa0jHv2iFryv8=
In-Reply-To: <122ccabe0805270019o22e5b93cw921d4137466ce64d@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

anyone could tell me why the error is happened,what problem with the
code and how to resolve it?
any help is appreciated!

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/workqueue.h>
#include <linux/in.h>
#include <linux/inet.h>
#include <linux/socket.h>
#include <net/sock.h>

static struct socket *sock;
static struct work_struct work;
static int tcp_sendto(struct socket *sock, void * buff, size_t len,
                unsigned flags, struct sockaddr *addr, int addr_len)
{
        struct kvec vec;
        struct msghdr msg;

        vec.iov_base=buff;
        vec.iov_len=len;

        memset(&msg, 0x00, sizeof(msg));
        msg.msg_name=addr;
        msg.msg_namelen=addr_len;
        msg.msg_flags = flags | MSG_DONTWAIT | MSG_NOSIGNAL;

        return kernel_sendmsg(sock, &msg, &vec, 1, len);
}



static char *hello = "hello";

static void sendmsg(void *dummy)
{
        int n;
        struct sockaddr_in addr;
        memset(&addr, 0x00, sizeof(addr));
        addr.sin_family = AF_INET;
        addr.sin_port = htons(15221);
        addr.sin_addr.s_addr = in_aton("192.168.0.102");
        n = tcp_sendto(sock, hello, 6, 0, (struct sockaddr *)&addr,
sizeof(addr));
        if(n == -EPIPE) {
            printk("broken pipe\n");
        } else {
            printk("send %d bytes\n", n);
        }

}

static int __init socket_init(void)
{
        sock_create_kern(PF_INET, SOCK_STREAM, IPPROTO_TCP, &sock);
        INIT_WORK(&work, sendmsg, NULL);
        schedule_work(&work);
        return 0;
}

static void __exit socket_exit(void)
{
        sock_release(sock);
}



module_init(socket_init);
module_exit(socket_exit);
