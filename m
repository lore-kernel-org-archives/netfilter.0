From: Robert Cole <robert.cole@support4linux.com>
Subject: 3 part firewall
Date: Tue, 20 May 2003 23:42:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305202342.51581.robert.cole@support4linux.com>
Reply-To: robert.cole@support4linux.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Like David T I'm a bit frustrated myself. :)

The flexiblity of iptables has got me pulling my hair out. Here's what I would 
like to do:

I have a server that has 3 real interfaces (no aliases). eth0 is the public, 
eth1 is the private and eth2 is the DMZ interface. All the books and docs 
I've seen so far work with only two interfaces and trying to adapt those 
scripts is giving me a headache.

I want to allow all private traffic out to the internet through PAT (port 
address translation). But when going from the LAN to the DMZ I want no nat or 
pat going on, only when leaving to the internet. 

Next I would like a strict rule that allows another public IP to be 1 to 1 
nat'd from the public interface to a server out the DMZ interface.

I've got the new riders second edition of the linux firewalls book and tons of 
howto's and yet I'm having trouble putting together this simple firewall.

I'm currently using narc to setup the firewall and it appears to work to get 
basic internet bound traffic from the lan and I can get to the DMZ from the 
LAN without translation so I'm close here but getting the 1 to 1 NAT working 
is causing me grief.

Any ideas?

Thanks,
Robert


