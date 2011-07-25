From: "Julio A. Romero" <julioarr@fisica.uh.cu>
Subject: about iptables option --goto
Date: Mon, 25 Jul 2011 14:21:49 -0400
Message-ID: <E8EB29BAE3D8487DB30D601B81B21E5A@poweredge1800>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

hi all,

in man page says:

-g, --goto chain
              This  specifies  that  the  processing  should  continue in a 
user specified chain.
              Unlike the --jump option return will not continue  processing 
in  this  chain  but
              instead in the chain that called us via --jump.

What happen when option return will not continue processing in a built-in 
chain (INPUT, OUTPUT, FORWARD), the built-in chain policy?



thanks,

julio

