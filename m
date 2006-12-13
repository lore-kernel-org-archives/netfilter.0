From: "Thirumal Saminathan" <thiruns@gmail.com>
Subject: Problem with asterisk 1.4 Installation (undefined
	reference to `ast_copy_string')
Date: Wed, 13 Dec 2006 15:37:20 +0530
Message-ID: <8c271aee0612130207w3a01eeaetfa2cd020bfbaadc@mail.gmail.com>
References: <8c271aee0612130145g7dcfba2sf9020783b492105f@mail.gmail.com>
Reply-To: Asterisk Users Mailing List - Non-Commercial Discussion
	<asterisk-users@lists.digium.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7724343590145817657=="
Return-path: <asterisk-users-bounces@lists.digium.com>
In-Reply-To: <8c271aee0612130145g7dcfba2sf9020783b492105f@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.digium.com/mailman/listinfo/asterisk-users>,
	<mailto:asterisk-users-request@lists.digium.com?subject=unsubscribe>
List-Archive: <http://lists.digium.com/pipermail/asterisk-users>
List-Post: <mailto:asterisk-users@lists.digium.com>
List-Help: <mailto:asterisk-users-request@lists.digium.com?subject=help>
List-Subscribe: <http://lists.digium.com/mailman/listinfo/asterisk-users>,
	<mailto:asterisk-users-request@lists.digium.com?subject=subscribe>
Sender: asterisk-users-bounces@lists.digium.com
Errors-To: asterisk-users-bounces@lists.digium.com
To: asterisk-dev@lists.digium.com, asterisk-users@lists.digium.com, netfilter@lists.netfilter.org, ntop@unipi.it

--===============7724343590145817657==
Content-Type: multipart/alternative; 
	boundary="----=_Part_130902_12854271.1166004440168"

------=_Part_130902_12854271.1166004440168
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi.

After successfully running ./configure I run make. When running make I get
the
following error..
  [CC] ast_expr2f.c -> ast_expr2f.o
   [CC] ast_expr2.c -> ast_expr2.o
   [CC] strcompat.c -> strcompat.o
   [LD] aelparse.o aelbison.o pbx_ael.o ael_main.o ast_expr2f.o ast_expr2.o
strcompat.o -> aelparse
aelparse.o(.text+0x3029): In function `ael_yylex':
/usr/src/asterisk1/asterisk-1.4.0-beta3/utils/ael.flex:417: undefined
reference to `ast_copy_string'
ast_expr2f.o(.text+0x1198): In function `ast_expr':
/usr/src/asterisk1/asterisk-1.4.0-beta3/utils/ast_expr2.fl:248: undefined
reference to `ast_copy_string'
collect2: ld returned 1 exit status
make[1]: *** [aelparse] Error...

plz could answer this issue.


-nsthi

------=_Part_130902_12854271.1166004440168
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<span class="gmail_quote"><br></span>Hi.<br>
<br>
After successfully running ./configure I run make. When running make I get the<br>
following error..<br>
&nbsp; [CC] ast_expr2f.c -&gt; ast_expr2f.o<br>
&nbsp;&nbsp; [CC] ast_expr2.c -&gt; ast_expr2.o<br>
&nbsp;&nbsp; [CC] strcompat.c -&gt; strcompat.o<br>
&nbsp;&nbsp; [LD] aelparse.o aelbison.o pbx_ael.o ael_main.o ast_expr2f.o ast_expr2.o strcompat.o -&gt; aelparse<br>
aelparse.o(.text+0x3029): In function `ael_yylex':<br>
/usr/src/asterisk1/asterisk-1.4.0-beta3/utils/ael.flex:417: undefined reference to `ast_copy_string'<br>
ast_expr2f.o(.text+0x1198): In function `ast_expr':<br>
/usr/src/asterisk1/asterisk-1.4.0-beta3/utils/ast_expr2.fl:248: undefined reference to `ast_copy_string'<br>
collect2: ld returned 1 exit status<br>
make[1]: *** [aelparse] Error...<br>
<br>
plz could answer this issue.<br>
<br>
<br>
-nsthi<br>

------=_Part_130902_12854271.1166004440168--

--===============7724343590145817657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
--Bandwidth and Colocation provided by Easynews.com --

asterisk-users mailing list
To UNSUBSCRIBE or update options visit:
   http://lists.digium.com/mailman/listinfo/asterisk-users

--===============7724343590145817657==--
