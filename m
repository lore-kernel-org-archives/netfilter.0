From: Pavlos Parissis <p_pavlos@freemail.gr>
Subject: Re: No such file or directory when using an asterisk
Date: Tue, 26 Nov 2002 23:51:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021126235120.4e1c3bf3.p_pavlos@freemail.gr>
References: <000001c294a6$db3c4f80$010da8c0@mrboboo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c294a6$db3c4f80$010da8c0@mrboboo.com>
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

Hello Robert,

On Mon, 25 Nov 2002 11:19:44 -0600 "Robert Wideman"
<rwideman@austin.rr.com> wrote:
>  Getting errors with my script when I am running it.  My system works
>  fine except for these echo commands:
>  echo 1 > /proc/sys/net/ipv4/conf/*/log_martians
>  The error that I get when I run the script is "No such file or
>  directory." I can do the individual files without the "*" in there but
>  when I use the asterisk (*) I get an error "Ambiguous redirect" when run
>  from the command line.
>  Any thoughts?

you can try this.

for f in /proc/sys/net/ipv4/conf/*/log_martians; do
                if [ -e $f ] ; then
                        echo "1" > $f
                        echo  -n -e "..""enabled."
                else
                        echo -e "support not found!"
                fi
        done
Pavlos

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I love having the feeling of being in control
while i have the sensation of speed

The surfer of life
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


