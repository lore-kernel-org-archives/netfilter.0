From: Xter Xter <xterminat0r@yahoo.com>
Subject: TTL.patch problem !!!
Date: Fri, 19 Dec 2003 00:55:25 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031219085525.23231.qmail@web40413.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I took TTL.patch  from the packet patch-o-matic! I use
kernel 2.4.23! I copy the "TTL.patch" in
/usr/src/linux and I did:

patch -p0 < TTL.patch, and after that make menuconfig,


but there wasn't any TTL in the Netowrk Options! After
that i removed the kernel-source and copy new source.
And I copy the TTL.patch in /usr/src and I did the
same:

patch -p0 < TTL.patch.
 
But there wasn't any affect again! I noticed that in
the TTL.patch are the dirs linux-2.4.9-plain and so on
but I don't know how to change them!

Please help!

__________________________________
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing.
http://photos.yahoo.com/

