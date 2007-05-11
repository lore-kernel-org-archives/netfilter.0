From: Sven Agnew <sven@clue.co.za>
Subject: persistent packet marking for use in VPN creation.
Date: Fri, 11 May 2007 14:29:56 +0200
Message-ID: <464461C4.7090602@clue.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi all,

I am trying to set up a windows Road warrior VPN connection to a Gentoo 
Linux server running Linux Openswan U2.4.7/K2.6.18-gentoo-r6 (netkey).

I know that an option to persist encrypted packet marks across 
de-capsulation used to exist and that this feature has now gone away ( 
or so I am told ).

Could anyone tell me if there is a way to cause encrypted packets to be 
marked and then, after de-capsulation, have the mark persist onto the 
de-capsulated packet?
 If this is not possible, could anyone suggest another way to produce 
the results of getting a Windows VPN connection to a Linux server using 
Openswan?

Any suggestions would be welcome.

Thanks for your time,
Sven


