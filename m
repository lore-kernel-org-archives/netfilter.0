From: Stefan Praszalowicz <stefan@avedya.com>
Subject: Re: masquerading setting bogus source IP address
Date: 11 Sep 2002 13:31:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031743861.661.9.camel@bilbol>
References: <OF65B32C17.2F140FDE-ONC1256C31.003030A8-C1256C31.0030C91E@medisearch-int.co
	m>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BsfPHgpSDoyFn9E1yDM6"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF65B32C17.2F140FDE-ONC1256C31.003030A8-C1256C31.0030C91E@medisearch-int.co
	m>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Gert.Vandelaer@medisearch-int.com
Cc: netfilter@lists.netfilter.org


--=-BsfPHgpSDoyFn9E1yDM6
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2002-09-11 at 10:52, Gert.Vandelaer@medisearch-int.com wrote:

    Hya,
    
    first of all, I'd like to start by asking why you had to reboot the server
    ?


The server was acting weird, we had a bunch of different problems (like
no more dhcp, no more dns, some machines had access to the net and
others did not), and as we were 3 not very organized guys on the thing
we ended up rebooting it in confusion.

    
    After knowing that, there might be some more clues to follow ...
    Your problem fixer is not going to last because masq is the same as snat,
    with the difference that snat does not handle dynamic ip's (explained in
    docs ...)

Aha ! I did not know that ;) And that's good news too, because our
public IP is static.

    
    What IP range does your lan have ?  What is the IP (if any at all) of the
    nic connected to the DSL router ?


The lan IP range is 192.168.x.x/16, with subnets 192.168.1.x/24 being
the servers subnet and 192.168.3.x/24 the wireless lan hosts subnet.
The NIC to the DSL router is actually connected to a switch on which we
have the WLAN access points and the DSL router.
This NIC has IPs on both ranged: eth1/192.168.3.254 and
eth1:0/10.0.0.137

Thanks very much Gert for your quick response. I was happily surprised
to read your mail, which, starting by 'first of all...', gave me a warm
feeling of being listened to ;).

Stefan

    
    Cya,
    Gert
    
    
    
                                                                                                                                                
                        Stefan Praszalowicz                                                                                                     
                        <stefan@avedya.com>              To:     netfilter@lists.netfilter.org                                                  
                        Sent by:                         cc:                                                                                    
                        netfilter-admin@lists.net        Subject:     masquerading setting bogus source IP address                              
                        filter.org                                                                                                              
                                                                                                                                                
                                                                                                                                                
                        10/09/2002 08:04 PM                                                                                                     
                                                                                                                                                
                                                                                                                                                
    
    
    
    
    Hi guys,
    
    We're using a Linux 2.4 box as an ASDL gateway for our company office.
    
    Today after rebooting this server we catched a very strange problem...
    
    The gateway itself could access the net, but not the masqueraded machines.
    Running tcpdump, we saw that the gateway was setting the wrong source IP
    for the masqueraded connections.
    
    Basically, the packets it sent had src-addr set to 10.0.0.0.
    
    After restarting the pppoe/PPP link to the dsl modem, the source IP seemed
    to be incremented. I don't know for sure but at one point the IP was
    10.0.0.17 and next 10.0.0.18.
    
    I solved the problem by adding a SNAT rule before the MASQ one:
    iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
    iptables -t nat -I POSTROUTING 1 -j SNAT --to 217.128.104.14
    
    Has anybody seen this before ?
    Could it be related to the order in which we start things (like ppp,
    firewall scripts, ...)
    
    Thanks anyway
    
    =======================
    Some details about the tcpdump results:
    
    ** packets originating from the masqueraded hosts, with bogus src ip:
    
    19:09:19.693511 10.0.0.0.33514 > 128.8.10.90.domain:  29756 A?
    tracker.ambrosia.net. (38) (DF)
    19:09:19.693539 10.0.0.0.33514 > 193.252.19.3.domain:  17779+ A?
    login.oscar.aol.com. (37) (DF)
    mail.avedya.com. (33) (DF)
    19:09:20.693477 10.0.0.0.33514 > 128.63.2.53.domain:  6018 A?
    mail.edi-presse.fr. (36) (DF)
    
    ** packets originating from the gateway itself, src is OK
    19:09:23.985905 217.128.104.14.1049 > 193.252.19.3.domain:  11374+ A?
    yahoo.com. (27) (DF)
    19:09:24.128264 193.252.19.3.domain > 217.128.104.14.1049:  11374 2/5/5 A
    66.218.71.198, A 64.58.79.230 (229) (DF)
    
    
    
    
    
    

--=-BsfPHgpSDoyFn9E1yDM6
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.0">
</HEAD>
<BODY>
On Wed, 2002-09-11 at 10:52, Gert.Vandelaer@medisearch-int.com wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>Hya,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>first of all, I'd like to start by asking why you had to reboot the server</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>?</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">The server was acting weird, we had a bunch of different problems (like no more dhcp, no more dns, some machines had access to the net and others did not), and as we were 3 not very organized guys on the thing we ended up rebooting it in confusion.</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>After knowing that, there might be some more clues to follow ...</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Your problem fixer is not going to last because masq is the same as snat,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>with the difference that snat does not handle dynamic ip's (explained in</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>docs ...)</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">Aha ! I did not know that ;) And that's good news too, because our public IP is static.</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>What IP range does your lan have ?  What is the IP (if any at all) of the</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>nic connected to the DSL router ?</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">The lan IP range is 192.168.x.x/16, with subnets 192.168.1.x/24 being the servers subnet and 192.168.3.x/24 the wireless lan hosts subnet.</FONT>
<BR>
<FONT SIZE="3">The NIC to the DSL router is actually connected to a switch on which we have the WLAN access points and the DSL router.</FONT>
<BR>
<FONT SIZE="3">This NIC has IPs on both ranged: eth1/192.168.3.254 and eth1:0/10.0.0.137</FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">Thanks very much Gert for your quick response. I was happily surprised to read your mail, which, starting by 'first of all...', gave me a warm feeling of being listened to ;).</FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">Stefan</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Cya,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Gert</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                                                                                                                                            </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                    Stefan Praszalowicz                                                                                                     </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                    &lt;stefan@avedya.com&gt;              To:     netfilter@lists.netfilter.org                                                  </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                    Sent by:                         cc:                                                                                    </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                    netfilter-admin@lists.net        Subject:     masquerading setting bogus source IP address                              </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                    filter.org                                                                                                              </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                                                                                                                                            </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                                                                                                                                            </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                    10/09/2002 08:04 PM                                                                                                     </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                                                                                                                                            </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>                                                                                                                                            </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Hi guys,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>We're using a Linux 2.4 box as an ASDL gateway for our company office.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Today after rebooting this server we catched a very strange problem...</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>The gateway itself could access the net, but not the masqueraded machines.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Running tcpdump, we saw that the gateway was setting the wrong source IP</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>for the masqueraded connections.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Basically, the packets it sent had src-addr set to 10.0.0.0.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>After restarting the pppoe/PPP link to the dsl modem, the source IP seemed</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>to be incremented. I don't know for sure but at one point the IP was</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>10.0.0.17 and next 10.0.0.18.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>I solved the problem by adding a SNAT rule before the MASQ one:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>iptables -t nat -I POSTROUTING 1 -j SNAT --to 217.128.104.14</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Has anybody seen this before ?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Could it be related to the order in which we start things (like ppp,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>firewall scripts, ...)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Thanks anyway</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>=======================</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Some details about the tcpdump results:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>** packets originating from the masqueraded hosts, with bogus src ip:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>19:09:19.693511 10.0.0.0.33514 &gt; 128.8.10.90.domain:&nbsp; 29756 A?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>tracker.ambrosia.net. (38) (DF)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>19:09:19.693539 10.0.0.0.33514 &gt; 193.252.19.3.domain:&nbsp; 17779+ A?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>login.oscar.aol.com. (37) (DF)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>mail.avedya.com. (33) (DF)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>19:09:20.693477 10.0.0.0.33514 &gt; 128.63.2.53.domain:&nbsp; 6018 A?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>mail.edi-presse.fr. (36) (DF)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>** packets originating from the gateway itself, src is OK</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>19:09:23.985905 217.128.104.14.1049 &gt; 193.252.19.3.domain:&nbsp; 11374+ A?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>yahoo.com. (27) (DF)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>19:09:24.128264 193.252.19.3.domain &gt; 217.128.104.14.1049:&nbsp; 11374 2/5/5 A</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>66.218.71.198, A 64.58.79.230 (229) (DF)</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
</PRE>
    </BLOCKQUOTE>
</BODY>
</HTML>

--=-BsfPHgpSDoyFn9E1yDM6--


