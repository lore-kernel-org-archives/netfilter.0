From: paulc@ibiblio.org
Subject: filter parsing
Date: Sun, 23 Mar 2003 00:05:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030322235642.00b8e418@mail.clara.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Can anyone tell me if I got this right. I've read through the docs and 
think it works like this, but it's still a bit cloudy so I'd like 
confirmation before I try it and find out I've just blocked myself from the 
box until I can get physical access to it again.

Will iptables always check the rules in the order they are entered ? Eg. if 
I setup the following in the exact sequence as below...

[default policy: accept]
-A input -p tcp --syn -dport 22 -j ACCEPT
-A input -p tcp --syn -dport 8880 -j ACCEPT
-A input -p tcp --syn -dport 0:60000 -j DROP

Will this ignore all connection requests apart from port 22 and 8880 ?

Is there any other way of doing this ? (perhaps more efficient for 
example). I'd like all other types of packets to go through normally, and 
just kill of the connection attempts. 


