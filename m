From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Newbie - Where is my kernel? Can't run POM
Date: Wed, 8 Jan 2003 19:53:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030108195329.01d77b2f.arnt@c2i.net>
References: <002301c2b73e$e0f36ca0$3f00a8c0@tharryman>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002301c2b73e$e0f36ca0$3f00a8c0@tharryman>
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

On Wed, 8 Jan 2003 11:53:38 -0600, 
"Timothy Harryman" <timothy@woodlandscenics.com> wrote in message 
<002301c2b73e$e0f36ca0$3f00a8c0@tharryman>:

> It certainly is not in /usr/src/linux (nautilus & terminal show that
> /usr/src is empty - yes, I am showing all hidden/system files), nor
> anywhere else I have looked.
> 
> I have a default installation of RH 8.0, and through rhupdate, it has
> updated the kernel to 2.4.18-19.8.0
> 
> I am trying to install patch-o-matic 20030107, and the script prompts
> me for the KERNEL_DIR.
> 
> This is extremely frustrating, and any help is hugely appreciated!
> 
> <>< <>< <>< <>< <>< <>< <>< <>< <>< <>< <>< 
> Timothy 
> timothy@woodlandscenics.com
> 
> 
> 

..try 'rpm -ivh kernel-source-2.4.18-19.8.0.i386.rpm'.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



