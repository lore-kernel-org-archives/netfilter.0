From: Hardik Dalwadi <hardik@deeproot.co.in>
Subject: Re: Defining ip range in a rule
Date: Mon, 20 Mar 2006 17:19:34 +0530
Message-ID: <441E96CE.9010809@deeproot.co.in>
References: <441E907F.4060107@mmcomputer.hu>
Reply-To: Hardik Dalwadi <hardik@deeproot.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <441E907F.4060107@mmcomputer.hu>
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
To: McDouglas <mcdouglas@mmcomputer.hu>
Cc: netfilter@lists.netfilter.org

Hi McDouglas,

On Monday 20 March 2006 04:52 PM, McDouglas wrote:
> Hi,
> 
> I'd like to ask how to define an ip address range in a rule. I don't 
> mean using subnet mask but rather for example making a rule which will 
> block port 110 for the 10.10.2.50-10.10.2.150 ip range.

If your kernel is compiled with CONFIG_IP_NF_MATCH_IPRANGE=y
then check below Example.

iptables -I PREROUTING -t nat -m iprange --src-range
			       ^^^^^^^^^^^^^^^^^^^^^^	
10.10.2.50-10.10.2.150 -p tcp --dport 80 -j DNAT --to
^^^^^^^^^^^^^^^^^^^^^^^^^
10.10.2.1:3128


Hardik Dalwadi.

