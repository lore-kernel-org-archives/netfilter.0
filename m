From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: logging
Date: Sun, 25 Apr 2004 16:45:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404251645.05368.Antony@Soft-Solutions.co.uk>
References: <web-295076647@mail01.infosat.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-295076647@mail01.infosat.net>
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

On Sunday 25 April 2004 4:32 pm, IT Clown wrote:

> Hi All
>
> Does any one know what the local0 - local7 ( locally
> defined levels ) would log in syslog.

The name is a bit of a clue: "locally defined levels" are locally defined - 
ie: you can use them on your system for whatever you want - there's no 
convention or standard way of using these - they're provided so that you can 
do things with them which aren't convenient to do using the other pre-defined 
levels.

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


