From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Log Files
Date: Thu, 17 Jun 2004 09:55:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040617075540.GA30186@torres.ka0.zugschlus.de>
References: <1087458480.25468.76.camel@ca.npn>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1087458480.25468.76.camel@ca.npn>
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
Content-Transfer-Encoding: 7bit
To: Netfilter List <netfilter@lists.netfilter.org>

On Thu, Jun 17, 2004 at 12:48:00AM -0700, Patrick Nelson wrote:
> Is there any way to send to a specific log file?

Netfilter logs come as normal kernel messages, so you can't select by
facility.priority. I'd recommend using something like syslog-ng which
allows you to filter per regexp, or to use some post-processing
facility.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

