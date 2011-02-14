From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 16:43:05 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102141642040.14613@obet.zrqbmnf.qr>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org> <4D593F90.5020609@googlemail.com> <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr> <loom.20110214T155902-834@post.gmane.org> <alpine.LNX.2.01.1102141618310.12050@obet.zrqbmnf.qr>
 <loom.20110214T162258-861@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20110214T162258-861@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabrice <fabricedeyber@agilemesh.com>
Cc: netfilter@vger.kernel.org


On Monday 2011-02-14 16:25, Fabrice wrote:
>> 
>> On Monday 2011-02-14 16:03, Fabrice wrote:
>> 
>> >I'm using DESTDIR but it requires an absolute path which is only valid 
>> >on the platform I compile. Suppose the DESTDIR is my NFS which is what 
>> >my embedded platform uses, it will try to load the xtables libraries by 
>> >using the absolute path from the install. This path is unknown from the 
>> >embedded platform point of view.
>> 
>> 	./configure --prefix=/usr
>> 	make install DESTDIR=/srv/nfsroot
>> 
>> It can't be so hard to use that.
>
>That is what I do and you are right it's not hard. The problem is on the 
>embedded platform it will try to load the libs from /srv/nfsroot/ 

It won't. It will load then from the prefix. Otherwise, a helluva lot
Linux distros would have run into the problem already, because they
use DESTDIR when making their packages.

>which is not valid. The absolute path is only valid on the platform where the 
>install was done. I'm not sure if I explain the problem properly...I hope so...
