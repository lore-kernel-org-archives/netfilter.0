From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: ethernet headers and iptables counters
Date: Tue, 11 Nov 2003 10:37:40 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003f01c3a858$fbf212c0$8effa8c0@ESTACAO>
References: <1068455679.10203.4.camel@hohum.marcsnet.com> <200311100940.hAA9eij16696@agate.rockstone.co.uk> <200311102321.hAANLsj17218@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter ML <netfilter@lists.samba.org>

>
> It does occur to me to wonder whether the ISP counts IP headers, but I
really
> would expect them to do so, and even so, an IP header is only 24 bytes,
with
> up to 1452 bytes of data inside the packet (assuming an MTU of 1500).
For
> 24 bytes to make 12% difference your data would be only 200 bytes on
average,
> and this is far too low to be plausible.

    Your affirmation 'IP header is only 24 bytes' is wrong. IP header has,
at least, 20 bytes and can have up to 60 bytes if you use IP Options. But,
in almost all cases, you'll have IP with no options, which means 20 bytes
for the IP headers. It can have 24 bytes in some cases, no doubt, but it's
not right that is always will have 24 and only 24 bytes.

    There also Transport Layer (4) headers. Using TCP, for example, you'll
have at least 20 bytes on the TCP headers, being able to reach 64 bytes if
all TCP options are enabled.

    This small error cannot explain the 12% difference ....... but we should
notice it :)


    Sincerily,
    Leonardo Rodrigues


