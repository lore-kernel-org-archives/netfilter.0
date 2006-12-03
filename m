From: Martijn Lievaart <m@rtij.nl>
Subject: Re: -i interface filter not working for firewall
Date: Sun, 03 Dec 2006 17:08:09 +0100
Message-ID: <4572F669.1000206@rtij.nl>
References: <b020b8120611300905t7f440ef9mf940a128fd8d46e6@mail.gmail.com>
	<b020b8120611300908r386fda2apf6dc55fe09aee2b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b020b8120611300908r386fda2apf6dc55fe09aee2b@mail.gmail.com>
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
To: victor oliveira <victor.oliveira@concretesolutions.com.br>
Cc: netfilter@lists.netfilter.org

victor oliveira wrote:

> My problem is the following: I am able to connect from my machine to
> the firewall using both eth2 and eth3. However, note that the INPUT
> default is DROP, and the only rule on the INPUT SHOULD be filtering
> and only allowing connections to the eth2 and not the eth3
> interface...


You rules are a bit messy, but it should probably work. Are you sure you 
connect through eth3? You do say it is from the same machine, if you are 
connected to eth2 and address the ip addres of eth3, you still come in 
through eth2.

HTH,
M4


