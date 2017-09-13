From: Xiang Gao <qasdfgtyuiop@gmail.com>
Subject: An article on writing custom expression for nftables
Date: Wed, 13 Sep 2017 00:33:01 -0400
Message-ID: <CAMtaSwQjaLxz=QxM+ryZ+0r-TxuNkGjGVAi+ht+oqvTqx2pEcg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=2FCFsCc711+qRVb6oW9hS1NZf0nmW2AJVe+l/yxR8k4=;
        b=KRFfmvHvtumJhj+gjJlJXuuE3vaujE8aYjAEustfhZNP6OufPIjtyTIOB7y2FCCPex
         izjFk1sE4mB9gj2SsiHBQVFqIsZVy7R5ulUG+qF8EJXzRnxFT1GIRMaOmfpJjvUfgRE/
         SgddW7MAw+mW8frdH9rGegezk3u4UZSqDhLJCtdD5uCMWkKAgTYFhk4u6f/dY1phDT+5
         AsBAJXQessNBeP5KkrrdptcXBmljiLNadcFsozOWNn9QXF+/WVx7ToCuZtu6PmoE/jmO
         iMc2Wgpi3ssTPr6vzBvLBvLakOywTW2zHRoSd0He+ZNRstHIflGFwFjtvqDoC7L/Lw/t
         ZJLg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I write an article introducing how to write a kernel module and modify
user space tool, i.e. libnftnl and nftables, to add custom experssion.
The article is at:

https://zasdfgbnm.github.io/2017/09/07/Extending-nftables/

Hope this article is helpful.

To admins of nftables wiki:
If you think this article is good, would you mind give a link to this
article somewhere in the wiki?

Xiang Gao
