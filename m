From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: Re: Redirecting ports on localhost
Date: Wed, 31 Mar 2004 00:03:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080684198.2471.106.camel@localhost>
References: <20040330133505.22298.90925.Mailman@vishnu.netfilter.org>
	 <406980E5.6080107@personalsoft.com.br> <200403302013.40298.lists@edeca.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403302013.40298.lists@edeca.net>
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

tir, 30.03.2004 kl. 21.13 skrev David Cannings:

> I've linked to the English HTML version of the HOWTO, other languages and 
> formats are available at:
> 
> http://netfilter.org/documentation/index.html#documentation-howto
> 
> Have a read, see if you can make some sense of it.  If not, post back with 
> what you've tried and why it doesn't work.  For the record, I've never 
> tried redirecting a port to localhost although I can see no reason why it 
> would not work as any other does.  I will have to give it a go myself 
> when I have a few minutes spare.

Hi David,

Dunno if you're the one responsible for the general Netfilter HOWTO. But
if so, could you please change "iplimit" to "connlimit"? I've used vi to
great effect after txt2html for my own copy, but I frigged around with
iplimit for a while with the non-existent iplimit first. I was *not*
pleased.

B.t.w., connlimit works a treat :)

Best,

--Tonni

-- 

mail: billy - at - billy.demon.nl
http://www.billy.demon.nl


