From: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>
Subject: Ip range
Date: Wed, 16 Apr 2003 17:22:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B5747F3DB39FD411884B00B0D07808CCB6CA30@server10>
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
To: netfilter@lists.netfilter.org

Howdy,

I use an IP range 10.60.10.10 and 10.165.10.10 and 192.168.50.10
With subnet mask 255.255.0.0
But in my firewall script i have to us 10.60.0.0/8
And this shows up (off course) as 10.0.0.0 but if i use 10.60.0.0 i get an
error that this is not right.
How can i use the correct range so that i get 10.60.0.0 and 10.165.0.0 and
192.168.0.0 in my iptables ?

Thnx!

	--Tronstr@xsomic--

