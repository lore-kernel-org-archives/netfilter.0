From: "Bruno Nunes" <nunesb@gmail.com>
Subject: DROP before PREROUTING
Date: Wed, 3 May 2006 09:48:02 -0300
Message-ID: <52837e3e0605030548v485078e0w7ae6bbb9492d674a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi folks,
   i have this rule which forwards all incoming requests for ipA to a
local machine as you can see.
    iptables -t nat -A PREROUTING -d <ipA> -i eth0 -p tcp --dport 80
-j DNAT --to 192.168.1.4

  is there any way to allow only a range of machines to use this
specific rule (not interfering with the other rules)? dropping all
requests that are not welcome.

thanks

