From: Sudheer Divakaran <sudheer@svw.com>
Subject: A simple question
Date: Thu, 19 Aug 2004 08:06:52 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41241244.40804@svw.com>
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
To: Netfilter mailing list <netfilter@lists.netfilter.org>

Hi,

In almost all IP Tables articles I've found that the default policy of 
all tables (INPUT,OUTPUT,FORWARD) set to DROP.  I can understand it as 
far as INPUT and FORWARD tables are concerned, but I do not understand 
why should we set the default policy of OUTPUT chain to DROP.  OUTPUT 
chain is responsible for packets originating from the firewall itself.  
Whay should we DROP it?

Thanks,
Sudheer

