From: "Kevin Smith" <ksmith@perfht.com>
Subject: RE: netfilter digest, Vol 1 #778 - 8 msgs
Date: Thu, 17 Apr 2003 07:05:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLGFEALDADHNDAAFFEEHJDJAA.ksmith@perfht.com>
References: <20030416190301.23250.53934.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030416190301.23250.53934.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org

I did a bit of digging and looking and found out the problem, I chose the
wrong processor architecture (386 instead of 586). As soon as I changed it
and recompiled it booted like a champ.

Kev

------=_NextPart_000_0005_01C303F9.003020C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Not 100% sure if this is the correct forum, but I did get the patch from the
site :)
I Just Upgraded my RH7.2 Kernel to 2.4.20, all went well until it rebooted.
It reaches Grub, I choose the proper version, it displays the registers then
reboots.  I've been able to boot from an older kernel so I believe it is the
kernel itself. I am still troubleshooting this but would appreciate a few
suggestions on where to look. BTW the Only patches I put in it have to do
with NAT.
My next trick will be recompiling it with no patches (im hoping this does
the same thing as the only reason Im doing this is the patches),
Thanks,
Kev


