From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: my system is under syn-flood attack
Date: Mon, 23 Sep 2002 12:31:15 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209231227000.1469-100000@dns.toxicfilms.tv>
References: <3D8ECEAF.5030202@fugmann.dhs.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D8ECEAF.5030202@fugmann.dhs.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: pat@pat.i989.net, chenlf@cibn.com, netfilter@lists.netfilter.org

> > http://www.samag.com/documents/s=1824/sam0201h/0201h_s1.htm
> >
> Please do not do as the above link suggests.
I agree, it has been discussed some time ago, that nat table is not for
filtering. (That is why, the REJECT target is not valid in PREROUTING)

I have once experimented with SYN floods, i wrote a script to generated
spoofed SYN packets and flood the host. Linux 2.2 & 2.4 with syn_cookies
turned on worked fine, so did w2k boxes and HP-UX. I belive that what is
going on is that your hosts can not issue any connections without huge
delays, which is rather caused by the eaten bandwith by SYN floods, not
their connection table memory consuming habits.

Regards,
Maciej



