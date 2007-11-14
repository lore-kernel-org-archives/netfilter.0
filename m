From: "Goke Aruna" <goksie@gmail.com>
Subject: Can someone guide me on "kernel: nf_conntrack: table full, dropping packet"?
Date: Wed, 14 Nov 2007 07:29:09 +0100
Message-ID: <e3b0905d0711132229j7063b35bs3cbab071fceca0f@mail.gmail.com>
References: <e3b0905d0711130931w4991e196w32567cbfc0abc214@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=OiyjU2sAEVjEqDpyCNyTJi/l6Ul/MdQmEw+lpWVa99A=;
        b=Vx4Cz+09f3sE7CZPtlNtcrAi37XJDgDsRBof+RmzxCu0QS7XrYt9Y8Ahy1VRWdr57A/kt54OpHp6EkKElRMkwrfnfUGtE7KAQ4KZULyQSR4scLgDM8JtHQ793v/ZxT9hVD08XT7OCtFHtFT//DXUBlfHEiGp6U7WCmANrM1ZDE8=
In-Reply-To: <e3b0905d0711130931w4991e196w32567cbfc0abc214@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I am running linux bridge using iptables version 1.3.5 on FC5 with
kernel 2.6.20-1.2320.fc5smp

However, after running it for almost 3 months, I just discovered the
error below in my message log and all the traffic will drop and later
comes up again.

I will be glad for any pointer that can assists.

Goksie

Nov 11 15:01:38 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:02:38 india-tiger kernel: nf_conntrack: table full, dropping packet.
Nov 11 15:02:38 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:02:39 india-tiger kernel: nf_conntrack: table full, dropping packet.
Nov 11 15:04:35 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:06:57 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:09:49 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:10:54 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:12:55 india-tiger last message repeated 2 times
Nov 11 15:15:22 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:16:38 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:18:01 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:19:57 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:23:12 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:24:37 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:26:37 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:30:01 india-tiger last message repeated 2 times
Nov 11 15:31:33 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:32:35 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:33:49 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:37:04 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:42:58 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:44:00 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:45:01 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:46:58 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:48:04 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:49:40 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:54:36 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:56:00 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 15:59:18 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:02:51 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:05:32 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:06:34 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:08:42 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:19:06 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:20:56 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:31:47 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 16:31:58 india-tiger kernel: nf_conntrack: table full, dropping packet.
Nov 11 16:36:05 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
Nov 11 17:05:23 india-tiger kernel: possible SYN flooding on port
3128. Sending cookies.
