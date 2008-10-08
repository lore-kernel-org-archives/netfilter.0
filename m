From: "Michel Benoit" <murpme@gmail.com>
Subject: IP forwarding with MASQUERADE
Date: Wed, 8 Oct 2008 18:18:17 +0200
Message-ID: <c88e466f0810080918i5d5491eet2cbcb710be0b74aa@mail.gmail.com>
References: <c88e466f0810030507x7e601d09q1034c7cc18be9b57@mail.gmail.com>
	 <48E62AD3.9060001@riverviewtech.net>
	 <c88e466f0810070858o18687b09yabd9cc7e5a46391@mail.gmail.com>
	 <48EBA72B.80306@riverviewtech.net>
	 <B1254A48FE0EE04BAC4A09DD26CBF50203DA62A0@s080a1034.group.rwe.com>
	 <c88e466f0810080916x3e58de7cod018200f3b8e8c29@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=7XtvplrpaoPWTh0vZ7OuEXeqfq7HQEV4gXwo7Pl35BY=;
        b=gFwg9RX3uQrKco3s2ZmDsV9JIHdpCbgK6gtNyGQrtKeyGKXz9MKkZ0s2o6bGadwQCC
         niIe4kftP6dBiQiDtFsdRtshY/mw5eCHIWrydSe+uG44EmvG4IQixH5lSFMWLqNUGd8A
         hwC/S7lbQDTcBq6FDPJFW4zbL7ZOzRMqK/5nY=
In-Reply-To: <c88e466f0810080916x3e58de7cod018200f3b8e8c29@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

> I'm not an expert, so I answer it as a PM:

Out of curiosity, what does 'PM' stand for in this context?

>> I believe the connections that connection tracking is keeping
>> track of
>> are listed somewhere in /proc, but I don't know where off hand.
>
>> > My root file system is read-only?  Could that cause
>> problems?  Does the
>> > netfilter code generate any files in the root filesystem?
>
> Is your /proc filesystem writeable ?

The /proc filesystem seems to be rw:

# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev/root / ext2 ro 0 0
proc /proc proc rw 0 0
devpts /dev/pts devpts rw,gid=5,mode=620 0 0
tmpfs /tmp tmpfs rw 0 0
sysfs /sys sysfs rw 0 0
usbfs /proc/bus/usb usbfs rw 0 0
/dev/mtdblock6 /mnt/flash yaffs2 rw 0 0


BTW, Ii'm not running udev.  All /dev entries are statically created
as part of the rootfs.
Are there any /dev entries that must be present for masquerading to work?
