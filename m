From: ypresente@mrv.com (Yaron Presente)
Subject: many one-to-one NAT
Date: Sun, 16 May 2004 16:06:59 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A76773.2060402@mrv.com>
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
Cc: Yaron Presente <ypresente@mrv.com>

Hi All,
I'm a newbie to this list and I apologize if this question has already 
appeared in previous posts.
I would like to do NAT from a private range to a public range of the 
same size, in a way that just
the network part of the IP address would be translated.
For example, I would like a single iptables rule to map 192.168.10.0/24 
=> 10.1.1.0/24 as follows:
192.168.10.1 => 10.1.1.1
192.168.10.2 => 10.1.1.2
.
.
.
192.168.10.254 => 10.1.1.254

I know that I can do it by defining the whole set of rules explicitly, 
but I'm looking for a better solution in terms of simplicity and 
performance.
Can anyone help?
Thanks,

-- 
Yaron Presente
MRV International
Direct   : 972-4-9936237
Fax      : 972-4-9890564
Email   : ypresente@mrv.com
www.mrv.com





