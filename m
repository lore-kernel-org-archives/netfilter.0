From: Bimal Pandit <bimal.pandit@indoasian.com>
Subject: Re: Internet usage policy
Date: Tue, 10 May 2005 18:03:24 +0530
Message-ID: <4280AA14.8070607@indoasian.com>
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

 Dear Ayobami Oladejo,

			--------- SNIP -------

I am still a newbie in Linux. I have a challenge. Curently in my 
organisation, we want to run a policy not to allow some workstations to 
access the Internet until 6 p.m of each day. We currently use Squid on a 
RedHat Linux system.

			--------- SNIP -------

for this i think that you should define a time based acl to allow users accordingly.
make a group of users and an acl_name also make an acl for time that you want to give access and use it.

hope this will help you.


regards,

Bimal Pandit 
bimal.pandit@indoasian.com


