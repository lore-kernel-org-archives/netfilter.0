From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to redirect requests
Date: Thu, 20 Nov 2003 21:56:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311202157.hAKLv4723665@onyx.rockstone.co.uk>
References: <1025.200.206.190.27.1069189922.squirrel@webmail.knal.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1025.200.206.190.27.1069189922.squirrel@webmail.knal.com.br>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Tuesday 18 November 2003 9:12 pm, magu@afesta.net wrote:

> Hello all.
>
> I'm trying to redirect all requests coming from my internal machines, that
> contain www.smartlaunch.net to an internal machine. I've already
> succesfully redirected all requests of the IP address, but haven't managed
> to redirect the domain requests. Maybe it's not at all a job for iptables,
> but I wanted some light on this, since I don't know where to start.

I'd suggest Squid or Apache n proxy mode.

Netfilter works at OSI layers 3 & 4, not 7.

Antony.

-- 

Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.

