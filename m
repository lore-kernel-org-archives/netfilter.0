From: alucard@kanux.com
Subject: Re: forwarding on the same NIC
Date: Mon, 10 May 2004 18:09:23 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1292.192.168.74.154.1084226963.squirrel@192.168.74.154>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
    <200405102115.14089.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405102115.14089.Antony@Soft-Solutions.co.uk>
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

Hi again...

   I did it, and nothing happens, the 2nd webserver is fully operational
and I cant get to it from my server/router. Here's my nmap test:

PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
25/tcp   open  smtp
80/tcp   open  http
143/tcp  open  imap
3306/tcp open  mysql

and there's no 8080 port that could be getting packets

And here's my script again... maybe I'm missing something else...

-------------
echo "Borrando posibles reglas anteriores..."
iptables -F
iptables -X

echo "Habilitando politicas de negacion total de paquetes"

iptables -P FORWARD DROP
iptables -P INPUT DROP

echo "Reglas para paquetes de entrada y salida"

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

##internas
iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -i lo -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT

#para el forward a la maquina compaq

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT
--to-destination 10.73.219.77:80
echo 1 > /proc/sys/net/ipv4/ip_forward
-------------

Any sugestions pals?
Thanx again for your great help
Juan



> On Monday 10 May 2004 8:36 pm, alucard@kanux.com wrote:
>
>> Hi there...
>>
>>    I have been using netfilter for a while and now, I have to integrate
>> some other servers and somehow I can't get it to forward packets.
>
> Change:
>
>> iptables -A FORWARD -i eth0 -p tcp --dport 8080 -j ACCEPT
>
> Into:
>
> iptables -A FORWARD -i eth0 -p tcp --dport 80 -j ACCEPT
>
> Remember that PREROUTING (where you are changing the port number) happens
> before FORWARD.
>
> Regards,
>
> Antony.
>
> --
> I don't know, maybe if we all waited then cosmic rays would write all our
> software for us. Of course it might take a while.
>
>  - Ron Minnich, Los Alamos National Laboratory
>
>                                                      Please reply to the
> list;
>                                                            please don't CC
> me.
>
>
>


