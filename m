From: James Garrison <jhg@athensgroup.com>
Subject: Re: DHCP and conntrack?
Date: Fri, 07 Jun 2002 12:43:38 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D00F0CA.5030501@athensgroup.com>
References: <3D00E6A3.30006@athensgroup.com> <20020607173835.GA599@escape.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.samba.org

So what you're saying is that there's no "ip_conntrack_dhcp" function
builtin, analogous to ip_conntrack_ftp, that would maintain the
relationship in spite of the different port numbers, right?

sshore@escape.ca wrote:
> Since dhcp requests go out on port 68, and responses come back on port 67, 
> connection tracking will not relate them. you'll need to explicitly open 
> up a hole for the returning response.

-- 
James Garrison                                Athens Group, Inc.
mailto:jhg@athensgroup.com                    5608 Parkcrest Dr
http://www.athensgroup.com                    Austin, TX 78731
PGP: RSA=0x92E90A3B DH/DSS=0x498D331C         (512) 345-0600 x150



