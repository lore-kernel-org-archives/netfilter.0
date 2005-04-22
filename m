From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT problem when coming from private network
Date: Fri, 22 Apr 2005 00:22:55 -0400
Message-ID: <20050422042255.GA2412@bender.817west.com>
References: <49795.72.11.67.10.1114115075.squirrel@72.11.67.10>
	<200504212216.15006.Alistair@nerdnet.ca>
	<6.0.1.1.2.20050421193231.01d01a20@insight.ip3.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <6.0.1.1.2.20050421193231.01d01a20@insight.ip3.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Apr 21, 2005 at 07:35:33PM -0700, Royce Kemp wrote:
> at first this is what I thought the solution would be, but Mark Wells said 
> that his mail server is on the same subnet as the client machine 
> (192.168.1.8 and 192.168.1.34)... so why can't the mail server communicate 
> directly with the client machine? so packet go from client to firewall and 
> are redirected to the mail server.. then the mail server will arp for 
> 192.168.1.34 and return packet directly to him). is this not possible?

just as people refuse to search the ML archives, i refuse to re-type
this email for the 50th time.  speaking of #50--here it is:

  http://marc.theaimsgroup.com/?l=netfilter&m=110571844432115&w=2

-j

--
"Stewie: OK, Harold, what do you think of our Mad Lib
 Stewie: "Cinderella had two step-'watermelons', who were very 'smelly'
 to her. So her fair god'toilet' turned her pumpkin into a big 'fanny',
 and dragged her off to the 'poop'.
 Stewie: Oh, how ruthlessly absurd."
        --Family Guy

