From: =?iso-8859-1?Q?J=E9r=F4me_GAUTHIER?= <JGAUTHIER@sqli.com>
Subject: loadbalancing for firewall
Date: Tue, 12 Aug 2003 12:35:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <192353F2A074154C82068805541676F28A5ED3@mailhost.sqli.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi,

first sorry for my english !!

I want to make a loadbalancing cluster of 2 firewall on redhat 8.0.

each firewall have 5 interface.
    -Lan interface
    -DMZ interface 
    -External interface
    -RAS
    -semi-private

I use keepalived for manage vrrp.

Does keepalived can do loadbalancing ?? ( there is no realserver )
if yes, where find some sample configuration
if not, what product can i use ?

Thanks a lot !


Best Regards

jerome 

