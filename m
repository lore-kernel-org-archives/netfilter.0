From: "Nandan Bhat" <nlbhat@gmail.com>
Subject: Newbie request - a small clarification
Date: Tue, 12 Dec 2006 21:37:29 +0530
Message-ID: <4c8752e80612120807x56b0bff5l9b02d56773dbe2a1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi Rob, Pascal, Anisha:

I am sorry for not presenting the complete picture earlier.

(Recap)
192.168.1.6/255.255.255.0 (static) on eth0
192.168.0.0/24 by DHCP on eth1

I need to have mail to/from 192.168.0.10 from 192.168.1.0/24 network.

I forgot to mention that mail is already setup on 192.168.1.6 using
ports 25/110 .

Will it work to proxy on say 25000/11000 by using "-m mport -p tcp
--sports 25000,11000" in addition to the --dports 25,110?

Nandan

