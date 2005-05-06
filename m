From: Jean Rousseau Franco <franco@maila.com.br>
Subject: ifwadm to iptables
Date: Fri, 06 May 2005 08:45:15 -0400
Message-ID: <427B66DB.4010406@maila.com.br>
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

I have a rule from ifwadm that states:
# ipfwadm -F -i ACCEPT -m -P tcp -S 10.0.0.0/8 1024:65535 -D 
200.201.174.0/24) 80
and I need to translate it to iptables.
I appreciate any help!

Thank you

Jean

