From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multi Addressing... is it possible ?
Date: Fri, 30 Apr 2004 21:18:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404302118.44222.Antony@Soft-Solutions.co.uk>
References: <0776B9DA384FFB4C94A6B73F7DC87A6003F35C83@newman.p21.com> <1083355131.4092affc02756@sistemica.info>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083355131.4092affc02756@sistemica.info>
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

On Friday 30 April 2004 8:58 pm, Rhaoni Chiu Pereira wrote:

> Hi List,
>
>      Aldo, thanks for the tip... I didn't know about the -I parameter... I
> still have a doubt about a protocol type, I received a documentation of
> some rules that I have to create in my firewall and it has a ESP(50)
> Protocol and no port listed so I don't know how to make it using iptables!
> Does anyone know  what is this ESP(50) Protocol ?

ESP is Encapsulated Security Payload, used by IPsec.

http://www.cse.ohio-state.edu/cgi-bin/rfc/rfc2406.html

Regards,

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


