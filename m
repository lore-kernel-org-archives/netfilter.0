From: Dhirendra Pal Singh <list@actiswitch.com>
Subject: IP Limit
Date: Tue, 20 May 2003 15:54:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ECAB211.8030806@actiswitch.com>
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
To: Net Filter User <netfilter@lists.netfilter.org>

Hi all,
I want to limit no ip connections.
Now I am trying to use iplimit patch from patch-o-matic.
But when I run the following command given in the example .. it dosent 
works

iptables -p tcp --dport 23 -m iplimit --iplimit-above 2 -j REJECT

I got this command from the site and the docs. Can anyone please tell me 
what is wrong.. and how should I do it..??

Thanks in advance
Dp


