From: Ralf Hemmann <ralf@core-dump.de>
Subject: Re: Too scared....
Date: Tue, 11 Jun 2002 09:24:20 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <aeara9$8k8$2@main.gmane.org>
References: <E17HVTU-00062d-00@pooh.kjernsmo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <E17HVTU-00062d-00@pooh.kjernsmo.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


Hy

> I hope someone can take my paw and help me through the iptables setup,
> because I'm a bit scared of the possibility of locking myself out of my
> box...

I know what you mean and be shure - if you do not use a "roll back system"
you WILL lock you out of your server ;-))


Try to make your Firewall script like this:


!/bin/bash


#  Deadmans Switch
# like in german railways.
# The driver has to press a
# button when its buzzing.
# If the driver dont push the button the
# Train stops


case "$1" in

start)


   # your rules her
   # iptables -t nat bla


# At the verry end of start put something like this:

echo "Are you dead ?

answer with Ctrl C

"

sleep 4
echo "2 more"
sleep 4
echo "1 to go"
sleep 4

echo "OK open firewall"

iptables -P INPUT ACCPET 
iptables -P OUTPUT ACCPET
iptables -P FORWARD ACCPET

iptables -F
iptables -F -t nat

;;

stop )

# bla bla

;;


*)

echo "usage $0 Start | Stop "

esac


