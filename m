From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: public ip on LAN
Date: Fri, 2 Jan 2004 16:30:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021630.07811.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040102214805.030494d0@orangeinfoways.com> <20040102092201.55da5104.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040102092201.55da5104.mgale@utilitran.com>
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

On Friday 02 January 2004 4:22 pm, Michael Gale wrote:

> On Fri, 02 Jan 2004 22:00:16 +0530
>
> Amit Pasari <info@amitpasari.com> wrote:
> > Hello,
> > I am using Redhat 8.0 with iptables to provide my client internet
> > services . Everything is going well .
> > i have been giving private ips of 172.16.0.0 series to my clients .
> > But now some of my clients need public ips . i do have many public ips
> > with me .so can somebody tell how can i give public ips to my clients .
> >
> > Thanks & Regards
> > Amit
> > Orangeinfoways.com
>
> 	I have never understood this configuration ... why would clients on a
> internal LAN need public IP addresses ?

Stupid protocols which bury OSI layer 3/4 information inside layer 7 
datagrams.

Examples: H.323, FTP, PPTP.

Without a NAT helper which understands what to change inside the packets, so 
that it matches the headers, you can't use these protocols across NATted 
connections.

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


