<!--{*
/*
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 */
*}-->
<script language="JavaScript">
<!--
var flag = 0;

function setFlag(){
	flag = 1;
}

function checkFlagAndSubmit(){
	if ( flag == 1 ){
		if( confirm('内容が変更されています。続行すれば変更内容は破棄されます。\n宜しいでしょうか？' )){
			fnSetvalAndSubmit( 'form1', 'mode', 'edit' );
		} else {
			return false;
		}
	} else {
		fnSetvalAndSubmit( 'form1', 'mode', 'edit' );
	}
}

function lfnCheckSubmit(){
	
	fm = document.form1;
	var err = '';
	
	if ( ! fm["send_type"][0].checked && ! fm["send_type"][0].checked ){
		err += 'メールの方式を入力して下さい。';
	}
	if ( ! fm["subject"].value ){
		err += 'Subjectを入力して下さい。';
	}
	if ( ! fm["body"].value ){
		if ( err ) err += '\n';
		err += 'メールの本文を入力して下さい。';
	}
	if( ! fm["template_name"]){
		if ( err ) err += '\n';
		err += 'テンプレートの名前を入力して下さい。';
	}
	if ( err ){
		alert(err);
		return false;
	} else {
		if(window.confirm('内容を登録しても宜しいですか')){
			return true;
		}else{
			return false;
		}
	}
}
//-->
</script>

<!--★★メインコンテンツ★★-->
<table width="878" border="0" cellspacing="0" cellpadding="0" summary=" ">
<form name="form1" id="form1" method="POST" action="<!--{$smarty.server.PHP_SELF|escape}-->" onsubmit="return lfnCheckSubmit();" >
<input type="hidden" name="mode" value="regist">
<!--{assign var=key value="template_id"}-->
<input type="hidden" name="template_id" value="<!--{$arrForm[$key]|escape}-->">
	<tr valign="top">
		<td background="<!--{$smarty.const.URL_DIR}-->img/contents/navi_bg.gif" height="402">
			<!--▼SUB NAVI-->
			<!--{include file=$tpl_subnavi}-->
			<!--▲SUB NAVI-->
		</td>
		<td class="mainbg">
			<!--▼登録テーブルここから-->
			<table width="737" border="0" cellspacing="0" cellpadding="0" summary=" ">
				<!--メインエリア-->
				<tr>
					<td align="center">
						<table width="706" border="0" cellspacing="0" cellpadding="0" summary=" ">
							<tr><td height="14"></td></tr>
							<tr>
								<td colspan="3"><img src="<!--{$smarty.const.URL_DIR}-->img/contents/main_top.jpg" width="706" height="14" alt=""></td>
							</tr>
							<tr>
								<td background="<!--{$smarty.const.URL_DIR}-->img/contents/main_left.jpg"><img src="<!--{$smarty.const.URL_DIR}-->img/common/_.gif" width="14" height="1" alt=""></td>
								<td bgcolor="#cccccc">
								<table width="678" border="0" cellspacing="0" cellpadding="0" summary=" ">
									<tr>
										<td colspan="3"><img src="<!--{$smarty.const.URL_DIR}-->img/contents/contents_title_top.gif" width="678" height="7" alt=""></td>
									</tr>
									<tr>
										<td background="<!--{$smarty.const.URL_DIR}-->img/contents/contents_title_left_bg.gif"><img src="<!--{$smarty.const.URL_DIR}-->img/contents/contents_title_left.gif" width="22" height="12" alt=""></td>
										<td bgcolor="#636469" width="638" class="fs14n"><span class="white"><!--コンテンツタイトル-->メール設定</span></td>
										<td background="<!--{$smarty.const.URL_DIR}-->img/contents/contents_title_right_bg.gif"><img src="<!--{$smarty.const.URL_DIR}-->img/common/_.gif" width="18" height="1" alt=""></td>
									</tr>
									<tr>
										<td colspan="3"><img src="<!--{$smarty.const.URL_DIR}-->img/contents/contents_title_bottom.gif" width="678" height="7" alt=""></td>
									</tr>
									<tr>
										<td colspan="3"><img src="<!--{$smarty.const.URL_DIR}-->img/contents/main_bar.jpg" width="678" height="10" alt=""></td>
									</tr>
								</table>

								<table width="678" border="0" cellspacing="1" cellpadding="8" summary=" ">
									<tr class="fs12n">
										<td bgcolor="#f2f1ec">メール形式<span class="red"> *</span></td>
										<td bgcolor="#ffffff"><span <!--{if $arrErr.send_type}--><!--{sfSetErrorStyle}--><!--{/if}-->><!--{html_radios name="send_type" options=$arrSendType separator="&nbsp;" selected=$arrForm.send_type}--></span>
										<!--{if $arrErr.send_type}--><br><span class="red12"><!--{$arrErr.send_type}--></span><!--{/if}-->
										</td>
									</tr>
									<tr>
										<td bgcolor="#f2f1ec" width="160" class="fs12n">テンプレート<span class="red"> *</span></td>
										<td bgcolor="#ffffff" width="557" class="fs10n">
										<!--{assign var=key value="template_name"}-->
										<span class="red12"><!--{$arrErr[$key]}--></span>
										<input type="text" name="template_name" value="<!--{$arrForm[$key]|escape}-->" onChange="setFlag();" size="30" class="box30" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
										</td>
									</tr>
									<tr>
										<td bgcolor="#f2f1ec" width="160" class="fs12n">メールタイトル<span class="red"> *</span></td>
										<td bgcolor="#ffffff" width="557" class="fs10n">
										<!--{assign var=key value="subject"}-->
										<span class="red12"><!--{$arrErr[$key]}--></span>
										<input type="text" name="subject" value="<!--{$arrForm[$key]|escape}-->" onChange="setFlag();" size="30" class="box30" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
										</td>
									</tr>
									<tr>
										<td bgcolor="#f2f1ec" colspan="2" class="fs12n"><span class="red"> *</span>名前差し込み時は {name} といれてください。<br><span class="red"> *</span>メールの内容は [[body]] に挿入されます。</td>
									</tr>
									<tr>
										<td bgcolor="#f2f1ec" width="160" class="fs12">本文</td>
										<td bgcolor="#ffffff" width="557" class="fs10">
										<!--{assign var=key value="body"}-->
										<span class="red12"><!--{$arrErr[$key]}--></span>
										<textarea name="body" cols="75" rows="20" class="area75" onChange="setFlag();" style="<!--{$arrErr[$key]|sfGetErrorColor}-->"><!--{$arrForm[$key]|escape}--></textarea><br />
										<span class="red"> （上限<!--{$smarty.const.LTEXT_LEN}-->文字）
										</span>
						
										<div align="right">
											<input type="button" width="110" height="30" value="文字数カウント" onclick="fnCharCount('form1','header','cnt_header');" border="0" name="next" id="next" />
											<br>今までに入力したのは
											<input type="text" name="cnt_header" size="4" class="box4" readonly = true style="text-align:right">
											文字です。
										</div>
						
										</td>
									</tr>
								</table>

								<table width="678" border="0" cellspacing="0" cellpadding="0" summary=" ">
									<tr>
										<td bgcolor="#cccccc"><img src="<!--{$smarty.const.URL_DIR}-->img/common/_.gif" width="1" height="5" alt=""></td>
										<td><img src="<!--{$smarty.const.URL_DIR}-->img/contents/tbl_top.gif" width="676" height="7" alt=""></td>
										<td bgcolor="#cccccc"><img src="<!--{$smarty.const.URL_DIR}-->img/common/_.gif" width="1" height="5" alt=""></td>
									</tr>
									<tr>
										<td bgcolor="#cccccc"><img src="<!--{$smarty.const.URL_DIR}-->img/common/_.gif" width="1" height="10" alt=""></td>
										<td bgcolor="#e9e7de" align="center">
										<table border="0" cellspacing="0" cellpadding="0" summary=" ">
											<tr>
												<td><input type="image" onMouseover="chgImgImageSubmit('<!--{$smarty.const.URL_DIR}-->img/contents/btn_regist_on.jpg',this)" onMouseout="chgImgImageSubmit('<!--{$smarty.const.URL_DIR}-->img/contents/btn_regist.jpg',this)" src="<!--{$smarty.const.URL_DIR}-->img/contents/btn_regist.jpg" width="123" height="24" alt="この内容で登録する" border="0" name="subm" ></td>
											</tr>
										</table>
										</td>
										<td bgcolor="#cccccc"><img src="<!--{$smarty.const.URL_DIR}-->img/common/_.gif" width="1" height="10" alt=""></td>
									</tr>
									<tr>
										<td colspan="3"><img src="<!--{$smarty.const.URL_DIR}-->img/contents/tbl_bottom.gif" width="678" height="8" alt=""></td>
									</tr>
								</table>
								</td>
								<td background="<!--{$smarty.const.URL_DIR}-->img/contents/main_right.jpg"><img src="<!--{$smarty.const.URL_DIR}-->img/common/_.gif" width="14" height="1" alt=""></td>
							</tr>
							<tr>
								<td colspan="3"><img src="<!--{$smarty.const.URL_DIR}-->img/contents/main_bottom.jpg" width="706" height="14" alt=""></td>
							</tr>
							<tr><td height="30"></td></tr>
						</table>
					</td>
				</tr>
				<!--メインエリア-->
			</table>
			<!--▲登録テーブルここまで-->
		</td>
	</tr>
</form>
</table>
<!--★★メインコンテンツ★★-->

