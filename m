From: Arnaud Meylan <ameylan@qualcomm.com>
Subject: userspace handling
Date: Wed, 12 Jun 2002 16:12:07 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.2.20020612160522.00b4dd90@jittlov.qualcomm.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hope I'm posting in the right list - did not find a better place

I try to run simuwan_usr from Jerome Etienne (http://off.net/~jme/)
I do the following :
$ simuwan_usr -d 1 -D 2 -r 1

of course nothing happens (:-)
then I detour packets to ip_queue
$ iptables -A OUTPUT -p 0 -j QUEUE

and all ip stack goes down - looks like ip packets just fall on the floor 
instead of being handled by ip_queue and passed to simuwan_usr.

when I iptables -F then it is ok again

I guess the ip_queue module does not it's job properly
How can I check it ?

thanks in advance

arn


