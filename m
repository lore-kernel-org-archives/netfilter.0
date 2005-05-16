From: Jason Opperisano <opie@817west.com>
Subject: Re: Internal PC/external Gateway
Date: Mon, 16 May 2005 17:48:13 -0400
Message-ID: <20050516214813.GA31167@bender.817west.com>
References: <1116061176.12835.20.camel@debianbox>
	<20050514153608.GA24455@bender.817west.com>
	<1116087634.18707.2.camel@debianbox>
	<20050514164144.GA24669@bender.817west.com>
	<1116090083.18707.6.camel@debianbox>
	<20050514172613.GA24810@bender.817west.com>
	<1116095410.18707.14.camel@debianbox>
	<20050514190005.GA25010@bender.817west.com>
	<1116114764.20275.0.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1116114764.20275.0.camel@debianbox>
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

On Sun, May 15, 2005 at 02:52:44AM +0300, Sadus . wrote:
> When i run this:
> ip rule add from 192.168.1.3 table T2
> 
> i get this error:
> RTNETLINK answers: Invalid argument

did you:

  echo 202 T2 >> /etc/iproute2/rt_tables

if you haven't i believe your error would be more along the lines of 
'Error: argument "T2" is wrong: invalid table ID'

does this give you the same error:

  ip rule add from 192.168.1.3 table main

if so--verify that your kernel was compiled with:

  CONFIG_IP_ADVANCED_ROUTER=y
  
if not--i don't believe you will be able to do policy routing until you
recompile your kernel with the proper options set.

-j

--
"Stewie: Yes, I rather like this God fellow. He's very theatrical, you
 know, a pestilence here, a plague there. Omnipotence. Gotta get me some
 of that."
        --Family Guy

