From: Jason Opperisano <opie@817west.com>
Subject: Re: Internet usage policy
Date: Tue, 10 May 2005 09:32:40 -0400
Message-ID: <20050510133240.GA9011@bender.817west.com>
References: <mailman.0.1115718084.11687.netfilter@lists.netfilter.org>
	<BAY12-F8D78244E7EC55433A54F3DE1F0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY12-F8D78244E7EC55433A54F3DE1F0@phx.gbl>
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

On Tue, May 10, 2005 at 09:40:55AM +0000, Ayobami Oladejo wrote:
> 
> Hello,
> 
> I am still a newbie in Linux. I have a challenge. Curently in my 
> organisation, we want to run a policy not to allow some workstations to 
> access the Internet until 6 p.m of each day. We currently use Squid on a 
> RedHat Linux system.
> How can I do this.

squid supports time-based ACL's:

  http://squid.visolve.com/squid/squid24s1/access_controls.htm

-j

PS - squid has its own list:
     http://www.squid-cache.org/mailing-lists.html

--
"Lois: So he just left without saying anything?
 Peter: All I asked him to do was buy some peanuts and cracker jacks.
 Brian: I don't care if he ever gets back. I wasn't being cute. I really
 hope he's dead."
        --Family Guy

