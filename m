From: Phil Crooker <pcrooker@orix.com.au>
Subject: Broken MS tcp new not syn: better to REJECT or DROP?
Date: Fri, 24 Jan 2003 09:31:42 +1030
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4716.24504211849$1043802982@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

We've a recent install of iptables and came across the broken ms tcp 
problem. I was wondering, would rejecting the packet be faster than 
dropping it for the client?  Comparing the webserv and iptables logs 
there doesn't seem to be much correlation. If there is, presumably the 
client will wait for a timeout before sending a proper syn packet. Or is 
IE too dumb to recognise the reject? Also has anyone found a good way to 
test this?

thanks in advance


