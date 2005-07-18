From: Aleksandar Milivojevic <alex@milivojevic.org>
Subject: Re: Netfilter and IPSec interaction
Date: Sun, 17 Jul 2005 22:23:58 -0500
Message-ID: <42DB20CE.5040401@milivojevic.org>
References: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Aleksandar Milivojevic wrote:
> I'm writing set of firewall rules for IPSec based VPN, and have couple of
> questions.
> 
> I know that packets are supposed to go through Netfilter tables twice (as
> received from the wire, and than as outputed by IPSec module).  However, what I
> noticed is that this seems to be true only for incomming packets.  The outgoing
> packets seems to go through Netfilter tables only once.

Thanks to everybody who replied on the list and off-list.  I'll just 
write a short summary.

Apperently, this is a known problem and it has been discussed on 
Netfilter's development lists.  There are some patches that solve it, 
but they are not going to get into mainstream kernel since approach 
taken in them is problematic (and according to some sources, those 
patches are abandoned and not maintained anymore).  I wasn't able to 
find why the approach is problematic, but apperently answer to that 
question is burried somewhere in archives of Netfilter's development 
list.  Seems that correct approach to solve the problem still needs to 
be found (and once found and implemented will become part of mainstream 
kernel).

