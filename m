From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 12:42:57 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209111237190.32463-100000@dns.toxicfilms.tv>
References: <3D7F0B2E.3050501@fugmann.dhs.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7F0B2E.3050501@fugmann.dhs.org>
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
Cc: "Joe de Vera Jr." <jhoedv@we-amuse.com>, netfilter@lists.netfilter.org

> > can i make use of the iptables scripting to disable the access pages... for
> > example for code red it access /default.ida page while in nimda /root.exe
> > and cmd.exe
The short answer is no. Netfilter is a packet filter, it works on 3rd and
4th layer, You need a 5th layer application, like a proxy.

There are extensions to web browsers to prevent all those types of
attacks. Try www.ngsec.biz for information on modules to IIS and Apache
(yes, Apache also).

Also check out hogwash.

Regards,
Maciej Soltysiak


