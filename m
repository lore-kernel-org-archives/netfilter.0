From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: limit HTTP-GET requests per IP
Date: Fri, 30 Jan 2004 15:23:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401301523.31643.Antony@Soft-Solutions.co.uk>
References: <DAELKAPIKOFAFFKELNHOGECFCAAA.listuser@epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DAELKAPIKOFAFFKELNHOGECFCAAA.listuser@epygi.de>
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

On Friday 30 January 2004 1:00 pm, Nikolai Dahlem wrote:

> Hi,
>
> I got a problem. Various people are stupidly trying to mirror my webserver
> (wget and the like), which puts heavy load on it, due to the dynamic
> generation of pages. Is there a way to specify a limit on requests per
> second on an ip basis ?

I suggest you install Squid in Accelerator mode in front of the server and use 
the delay pools facility to limit bandwidth to groups of users.

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


