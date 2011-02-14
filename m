From: Fabrice <fabricedeyber@agilemesh.com>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 15:03:57 +0000 (UTC)
Message-ID: <loom.20110214T155902-834@post.gmane.org>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org> <4D593F90.5020609@googlemail.com> <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm using DESTDIR but it requires an absolute path which is only valid on the 
platform I compile. Suppose the DESTDIR is my NFS which is what my embedded 
platform uses, it will try to load the xtables libraries by using the absolute 
path from the install. This path is unknown from the embedded platform 
point of view.




