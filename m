From: Sebastian Docktor <sebi@tux-labor.de>
Subject: Re: Dynamic DNS
Date: Sun, 13 Mar 2005 17:28:03 +0100
Message-ID: <20050313162803.GG3751@gw.home.tux-labor.de>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<1110359242.7542.7.camel@nostromo.bgsecm.com>
	<20050309103543.GU4657@metastasis.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20050309103543.GU4657@metastasis.org.uk>
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
To: Nick Drage <nickd@metastasis.org.uk>
Cc: netfilter@lists.netfilter.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've written a bash Skript, which do that.
I know that this configuration ist not really Secure.

I do this what Nick Drage said:
> look up IP address for hostname.dyndns.net
> write that IP address to a file
> start an infinite loop here
> wait for a period of time
> look up IP address for hostname.dyndns.net
> if the IP address matches that in the file, do nothing
> otherwise do the following:
>      - write the new IP address to a file
>      - run the firewall script again
> go back to the beginning of the infinite loop

maybe somebody can look at the Skript and give me a feedback.
(I attached it)

Before the Skript starts, you have to add a rule like this
(In your normal Firewall Skript)

iptables -N $rulename 
iptables -A INPUT --destination $ext_ip -i ppp0 -j $rulename


sebi

On Wed, Mar 09, 2005 at 10:35:43AM +0000, Nick Drage wrote:
> On Wed, Mar 09, 2005 at 10:07:22AM +0100, Jose Maria Lopez Hernandez wrote:
> > El mi?, 09-03-2005 a las 07:25 +0100, Sebastian Docktor escribi?:
> 
> > > I want to allow a Dynamic DNS Client to Access the SSH-Server on my
> > > Firewall. But I don't want to open SSH for all IPs, Is it possible
> > > that iptables always looks up the ip address from the hostname, so
> > > that only the ip has access which is registrated under the dyndns?
> > 
> > I don't understand your problem. If you know your IP you can block
> > based on that IP.
> 
> The OP's problem is that the DNS will stay the same, say
> hostname.dyndns.net, but that the IP address associated with that name
> will change.  So as soon as the IP address changes, his rulebase is out
> of date.
> 
> > DNS, dynamic or not, has nothing to do with that.  Just everytime you
> > change your IP use the scripts used to to that to update the iptables
> > rules, it can be even done if you are using DHCP to get the IP.
> 
> This means the rulebase administrator has to know when the IP address
> changes and has to be able to run the script to deal with that change.
> And if the change is to *their* IP address, that means they can no
> longer access their firewall host.
> 
> Sebastian, I'd suggest two solutions, the easy one is to run your
> firewall script every minute, or two minutes, or five minutes, whatever
> suits.  That way your firewall will look up the IP address for the
> hostname and change its rulebase accordingly.
> 
> The harder but more elegant solution is to write a script in your
> favourite programming language that does the following:
> 
> look up IP address for hostname.dyndns.net
> write that IP address to a file
> start an infinite loop here
> wait for a period of time
> look up IP address for hostname.dyndns.net
> if the IP address matches that in the file, do nothing
> otherwise do the following:
>      - write the new IP address to a file
>      - run the firewall script again
> go back to the beginning of the infinite loop
> 
> And seeing as its sshd, watch hosts.allow and your sshd_config as well.
> 
> -- 
> http://www.bash.org/?quote=29355
> 
> 

-- 
Sebastian Docktor <sebi@tux-labor.de>

--k+w/mQv8wyuph6w0
Content-Type: application/x-sh
Content-Disposition: attachment; filename="update-netfilter-rule.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/sh=0A# Version: $Id: update-netfilter-rule.sh,v 1.2 2005/03/13 16:16=
:52 sebi Exp $=0A# Description: Erneuert die netfilter Regeln, damit man ne=
tfilter auch mit DynDNS Addr. nutzen kann.=0A# Es ist nat=FCrlich nicht son=
derlich sicher, sich auf IPs von einem DynDNS-Server zu verlassen, allerdin=
gs=0A# ist es immernoch besser als den Port komplett offen zu lassen.=0A#=
=0A# Funktionsweise:=0A#  look up IP address for hostname.dyndns.net=0A#  w=
rite that IP address to a file=0A#  tart an infinite loop here=0A#  wait fo=
r a period of time=0A#  look up IP address for hostname.dyndns.net=0A#  if =
the IP address matches that in the file, do nothing=0A#  otherwise do the f=
ollowing:=0A#      - write the new IP address to a file=0A#      - Flush di=
e specitic rule.=0A#  go back to the beginning of the infinite loop=0A=0A=
=0Ahostname=3D"doggy.dyn.leitwerk.net" #The dynamic Host.=0Achecktime=3D"2"=
 #The Check intervall.=0Atmpfile=3D"./$hostname.ip" =0Arulename=3D"dynamic_=
12000_access" # The Rulename to Flush.=0Aiptables=3D"/sbin/iptables" #The i=
ptables  Command.=0Alogfile=3D"/tmp/$0.log" #The location of the logfile.=
=0Apidfile=3D"/tmp/$0.pid" #The Pidfile=0A=0Alook_up() {=0A  local tmp_ip=
=0A  if [ "$1" =3D=3D "" ]; then=0A    echo "look_up: keine/zuwenige Argume=
nte Angegeben."=0A  fi=0A  tmp_ip=3D`/usr/bin/host -t A $1|/bin/grep addres=
s|/bin/sed -s 's/.*address \([0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{=
1,3\}\)$/\1/'`=0A  echo $tmp_ip=0A=0A}=0A=0Aupdate_netfilter_rules() {=0A  =
if [ "$1" =3D=3D "" ]; then=0A    echo "update_netfilter_rules: keine/zuwen=
ige Argumente Angegeben."=0A    return=0A  fi=0A   echo $iptables -t filter=
 -F $rulename=0A   $iptables -t filter -F $rulename=0A   echo $iptables -t =
filter -A $rulename --source $1 --destination "0.0.0.0/0" -p tcp --sport 10=
24:65535 --dport 22 -j ACCEPT=0A   $iptables -t filter -A $rulename --sourc=
e $1 --destination "0.0.0.0/0" -p tcp --sport 1024:65535 --dport 22 -j ACCE=
PT=0A  =0A}=0A=0A=0Acase $1 in =0A=0Astart)=0A  #Pidfile handling...=0A  if=
 [ -f $pidfile ]; then=0A    pid=3D`cat $pidfile`=0A    echo "$0 l=E4uft be=
reits mit der PID: $pid"=0A    exit 1=0A  fi=0A  =0A  #Subshell..=0A  echo =
$(($$+1)) > $pidfile=0A  (=0A  while true ; do =0A    =0A    sleep $checkti=
me=0A    ip=3D`look_up "$hostname"`=0A    if [ ! -f $tmpfile ]; then=0A    =
  echo $ip > $tmpfile=0A      update_netfilter_rules "$ip"=0A    else=0A   =
   old_ip=3D`/bin/cat $tmpfile`=0A      if [ "$old_ip" =3D=3D "$ip" ]; then=
=0A        #ip are equal...=0A        echo "ips are equal..."=0A        con=
tinue=0A      else=0A        echo "ips are not equal..."=0A        update_n=
etfilter_rules "$ip"=0A	echo $ip > $tmpfile=0A      fi=0A    fi=0A  done =
=0A  ) 2>&1  | /usr/bin/perl -ne '$|=3D1;chomp $_;$a=3Dtime();print "$a $_\=
n";'>> $logfile  &=0A;;=0A=0Astop)=0A=0A  #Pidfile handling...=0A  if [ -f =
$pidfile ]; then=0A    pid=3D`cat $pidfile`=0A    kill $pid=0A    rm $pidfi=
le=0A    exit=0A  else=0A    echo "$pidfile doesn't exist"=0A    exit 1=0A =
 fi=0A;;=0A=0Astatus)=0A  if [ -f $pidfile ]; then=0A    pid=3D`cat $pidfil=
e`=0A    echo "$0 l=E4uft mit der PID: $pid"=0A  else=0A    echo "$0 ist ni=
cht gestartet"=0A  fi=0A;;=0A=0Arestart)=0A $0 stop=0A $0 start=0A;;=0A=0A*=
)=0A echo "Invalid Option \"$1\""=0A echo "Usage: $0 [start|stop|restart]"=
=0A;;=0A=0Aesac=0A=0A=0A
--k+w/mQv8wyuph6w0--

