From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd: synchronization failures
Date: Mon, 16 Jan 2017 11:16:29 +0100
Message-ID: <20170116101629.GA5107@salvia>
References: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm>
 <alpine.LRH.2.00.1701112254250.25853@gjva.wvxbf.pm>
 <CAOkSjBj-X8F-Ca4vwocSsaZVzQN2R1MAUN+SCvCOb0XVPEzQ8Q@mail.gmail.com>
 <alpine.LRH.2.00.1701131558020.25853@gjva.wvxbf.pm>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.00.1701131558020.25853@gjva.wvxbf.pm>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>
Cc: Arturo Borrero Gonzalez <arturo@debian.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>, info@jablonka.cz

On Fri, Jan 13, 2017 at 04:01:43PM +0100, Jiri Kosina wrote:
> On Thu, 12 Jan 2017, Arturo Borrero Gonzalez wrote:
> 
> > I can see them too, in NATed connections most of the time:
> > 
> > Jan 12 08:54:09 cf03 conntrack-tools[32717]: inject-upd1: File exists
> > Jan 12 08:54:09 cf03 conntrack-tools[32717]: tcp      6 120 TIME_WAIT
> > src=192.168.5.181 dst=31.13.65.1 sport=57419 dport=443 [ASSURED]
> > Jan 12 08:54:09 cf03 conntrack-tools[32717]: inject-upd1: File exists
> > Jan 12 08:54:09 cf03 conntrack-tools[32717]: tcp      6 10 CLOSE
> > src=192.168.5.181 dst=31.13.65.1 sport=57419 dport=443 [ASSURED]
> > Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-add2: File exists
> > Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 120 SYN_SENT
> > src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443 [UNREPLIED]
> > Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-upd1: File exists
> > Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 60 SYN_RECV
> > src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443
> > Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-upd1: File exists
> > Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 432000
> > ESTABLISHED src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443
> > [ASSURED]
> 
> Do you also experience (either from inject-upd2 or inject-add2 phase) 
> EBUSY ones?
> 
> I'm seeing quite a lot of entries such as
> 
> 	(pid=9769) [ERROR] inject-add2: Device or resource busy
> 	        tcp      6 300 CLOSE src=10.33.37.4 dst=77.75.77.94 sport=42653 dport=443 [UNREPLIED]
> 
> I'm still trying to understand from the source what consequences this 
> might have; any hint would be appreciated.

Some conntrack attributes can also be set up from NEW flows.

Most likely this entry already exists in the kernel, and conntrackd is
trying to update it.
