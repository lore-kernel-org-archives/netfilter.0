From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: Update httpd.conf file:  Apache virtualhost not working behin
 d firewall.
Date: Sat, 21 Dec 2002 11:12:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E043E98.2050509@istitutocolli.org>
References: <3019863CF306D211BA4500A0CC30812DB4C250@exchange.cyberwolf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3019863CF306D211BA4500A0CC30812DB4C250@exchange.cyberwolf.com>
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
To: netfilter@lists.netfilter.org

Chip Upsal wrote:
> I doubt it is strictly an apache problem as if we remove the firewall and
> assign the external ip address to the server it all works well.

if you solved the iptables problem and you are properly forwarding 
traffic to the internal box, that's probably an apache issue: as far as 
i understand you are creating a name based virtul host: apache should 
look in the _http_headers_ to respond with the correct web server name. 
(http headers are indeed in packet payloads and iptables will not touch 
them when S/DNATting).

so:

NameVirtualHost 192.168.0.2
<VirtualHost 192.168.0.2>
    ServerName site4.company.com
    ServerAlias site4*
    ServerAdmin admin@company.com
    DocumentRoot D:/web_root/foo4
    ErrorLog logs/site4.cyberwolf.com-error_log
    CustomLog logs/site4.cyberwolf.com-access_log common
</VirtualHost>

hope that this is going to work (is working for me, though).
andrea


