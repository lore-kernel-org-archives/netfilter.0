From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Cannot Ping Local Network after Executing rc.firewall script
Date: Thu, 11 Mar 2004 19:30:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040311183040.D95B8F99@sterenborg.info>
References: <003a01c407f8$6a0bd260$36b4fea9@CYBERHUT.RUWI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003a01c407f8$6a0bd260$36b4fea9@CYBERHUT.RUWI>
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
To: netfilter@lists.netfilter.org

> I am using Iptables with Ip Masquearde, with a simple 
> rc.firewall script to share my internet connection for the 
> last so many months, today I configured a new server with the 
> same settings but after the script executes I am not able to 
> ping computers in my local network and the moment I restart 
> the Iptables I am able too?I just dont understand where I am 
> going wrong?Any pointers will be apprecaited.
>  
> I have enabled Ipforward!

We don't know what your script looks like so it's going to be hard.

If you can not ping from the firewall to the PC's then you should be
allowing INPUT traffic from your lan and OUTPUT traffic from the firewall.
Reading the above it seems to me that forwarding doesn't have anything to do
with this.
Not much more one can say without the rules.


Gr,
Rob


