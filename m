From: Valentin LAB <vaab@wanadoo.fr>
Subject: Weird behavior on simple -j MASQUERADE
Date: Fri, 24 May 2002 09:01:37 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CEDE551.7040403@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

Hi

    I made a complex firewall script that had very strange problems. I 
took plenty of time trying to find out what was wrong until I found that 
even this simple script (that is said to be working in NAT-HOWTO on 
netfilter website) had the same problems :


# Begin script

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

# Turn on IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# End script


    These are the strange behavior :

- Can access some http website (www.lemonde.fr www.google.com ...)
- Can't access some http website (www.yahoo.fr www.meteo-france.fr ..)
- Some apps that were working under a firewall under ipchains (the 
roaring penguin ADSL firewall script) do not work any more.

    I tried a simple "telnet www.yahoo.fr 80" to see what was wrong, 
connection was accepted, I typed "GET" and i received the HTML code to 
the ending "</html>", but it didn't close the connection as they did for 
the working website.
    A friend told me that it could be the website with cookies that are 
involved in the problem.

    My config :

Firewall :

    Processor : 486 DX 33 (is it enough ?)
    Connection type : ADSL (France telecom, modem ECI) on ppp0
    Kernel : Linux 2.4.18 + patch-o-matic 1.2.6a
    IPtable ver : 1.2.6a
    LAN device : NE2000 (10BASET) compatible device on eth0

LAN computer :

    Linux or win2000, with bigger config than Firewall connected on 100 
Mbits network device.
    DNS are those of the provider or an internal DNS. (that doesn't 
change anything to my problems)

I would appreciate a quick help. I'm quite new to firewall and iptables,
so even if you haven't the solution, i'll be glad to learn more. Do not 
hesitate to answers if you have something in mind.

                         Valentin LAB
                         mail : vaab at wanadoo.fr




