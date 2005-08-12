From: Eric Scopinho <eric.scopinho@uol.com.br>
Subject: Re: Blocking Google Earth
Date: Fri, 12 Aug 2005 20:59:13 -0300
Message-ID: <42FD37D1.5080806@uol.com.br>
References: <20050812201225.CE6DD2128@juno.tc.df.gov.br>	<42FD06B6.4080209@imag.fr>	<20050812223230.14D0920EB@juno.tc.df.gov.br>
	<200508130431.24772.arny@ats.s.bawue.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508130431.24772.arny@ats.s.bawue.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Maybe something like this would help:

iptables -I FORWARD -p TCP --dport 80 -m string --string "User-Agent: 
kh_lt/LT" -j DROP

P.S: I'm not able to test it right now. :-(

[]s

Eric Scopinho

Thilo Schulz wrote:
> On Saturday 13 August 2005 00:38, fabricio bianco abreu wrote:
> 
>>I would like to block it because a user using Google Earth consumes about
>>256kbps bandwith. I have 600+ users and only a 2Mbps link to the Internet.
> 


